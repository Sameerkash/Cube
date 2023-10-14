import 'package:cube/auth/secrets.dart';
import 'package:cube/core/networking/networking.dart';
import 'package:cube/core/networking/paths.dart';
import 'package:cube/features/onboarding/models/insight_card.dart';
import 'package:cube/features/onboarding/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingLoading());

  List<InsightCard> cardsData = [];

  Future<void> getOnBoardingInsights(String ideaInput,String aimInput,String financesInput) async {
    emit(OnBoardingAPILoading());
    String commonInput = 'I want to start a new business. My idea is : $ideaInput. My goal is : $aimInput, My financials are : $financesInput';
    await getInsights(commonInput, Constants.productInsightQuestion, Constants.productInsightHeading);
    await getInsights(commonInput, Constants.businessInsightQuestion, Constants.businessInsightHeading);
    await getInsights(commonInput, Constants.financesInsightQuestion, Constants.financesInsightHeading);
    emit(OnBoardingLoaded(cardsData));
  }

  Future<void> getInsights(String commonInput,String question,String cardHeading) async {
    String query = '$commonInput . $question';
    String response = await getPalmResponse(forQuery: query);
    InsightCard cardData = InsightCard(cardHeading, response);
    cardsData.add(cardData);
  }

  Future<String> getPalmResponse({required String forQuery}) async {
    Map<String, dynamic> body = {
      "prompt": {"text": forQuery},
      "temperature": 1
    };
    Response? response = await Networking.instance.postRequest(
      path: NetworkPaths.palmAiBaseUrl,
      body: body,
      params: {'key': Secrets.palmAPIKey},
      headers: {'Content-Type' : 'application/json'}
    );
    if (response != null && response.statusCode == 200) {
      String output = response.data['candidates'][0]['output'];
      return output.replaceAll('*', '');
    }
    return 'Failure Occured';
  }
}

abstract class OnBoardingState {}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingAPILoading extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  OnBoardingLoaded(this.cardsData);

  List<InsightCard> cardsData;
}

class OnBoardingReset extends OnBoardingState {}

class OnBoarded extends OnBoardingState {}
