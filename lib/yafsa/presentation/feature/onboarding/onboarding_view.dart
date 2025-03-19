import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yafsa/yafsa/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:yafsa/yafsa/presentation/feature/onboarding/bloc/onboarding_state.dart';

import '../../../../generated/l10n.dart';
import 'bloc/onboarding_event.dart';
import 'core/widget/onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _onboardingBloc = OnboardingBloc(pageViewController: PageController());

  @override
  void initState() {
    _onboardingBloc.context = context;
    _onboardingBloc.add(LoadOnboardingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
        child: SafeArea(
            child: Expanded(
                child: BlocBuilder<OnboardingBloc, OnboardingState>(
      bloc: _onboardingBloc,
      builder: (context, state) {
        if (state is OnboardingLoadedState) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _onboardingBloc.pageViewController,
                  itemCount: state.onboardingList.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      title: state.onboardingList[index],
                      description: '',
                    );
                  },
                  onPageChanged: (index) {
                    _onboardingBloc.add(OnboardingPageChangedEvent(index));
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SmoothPageIndicator(
                          controller: _onboardingBloc.pageViewController,
                          count: state.onboardingList.length,
                          effect: ExpandingDotsEffect()),
                      Spacer(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          textStyle: textTheme.titleSmall,
                          side: BorderSide(
                            color: colorScheme.primary,
                          ),
                        ),
                        onPressed: () {
                          _onboardingBloc.add(OnboardingNextPageEvent());
                        },
                        child: Text(S.of(context).general_next),
                      ),
                    ],
                  )),
            ],
          );
        }
        if (state is OnboardingErrorState) {
          return const Text('Error');
        }
        if (state is OnboardingInitialState) {
          return Center(
              child: SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(),
          ));
        }
        return Center(
            child: SizedBox(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(),
        ));
      },
    ))));
  }
}
