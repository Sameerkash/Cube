import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cube/auth/secrets.dart';
import 'package:cube/core/networking/networking.dart';
import 'package:cube/core/networking/paths.dart';
import 'package:cube/features/onboarding/models/insight_card.dart';
import 'package:cube/features/onboarding/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingLoading());

  List<InsightCard> cardsData = [];
  String? businessPitch;



  Future<void> getOnBoardingInsights(String ideaInput,String aimInput,String financesInput) async {
    emit(OnBoardingAPILoading());
    businessPitch = 'I want to start a new business. My idea is : $ideaInput. My goal is : $aimInput, My financials are : $financesInput';
    await getInsights(Constants.productInsightQuestion, Constants.productInsightHeading);
    await getInsights(Constants.businessInsightQuestion, Constants.businessInsightHeading);
    await getInsights(Constants.financesInsightQuestion, Constants.financesInsightHeading);
    emit(OnBoardingLoaded(cardsData));
  }

  Future<void> getInsights(String question,String cardHeading) async {
    String query = '$businessPitch . $question';
    String response = await getPalmResponse(forQuery: query);
    InsightCard cardData = InsightCard(cardHeading, response);
    cardsData.add(cardData);
  }

  Future<void> getWebsiteContent() async {
    emit(OnBoardingAPILoading());
    String query = '$businessPitch . ${Constants.websiteContentQuestion}';
    String response = await getPalmResponse(forQuery: query);
    response = response.replaceAll("`", "").replaceAll("json", "").replaceAll("\n", "");
    print('response is $response');
    Map<String,dynamic> websiteData = jsonDecode(response);
    final docRef = FirebaseFirestore.instance.collection('Users').doc(Secrets.merchantId);
    await docRef.set({
      'title' : websiteData['title'],
      'content' : websiteData['content'],
      'colors' : websiteData['colors'],
    });
    emit(OnBoarded());
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
