// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../dataLayer/api_manager/api.dart' as _i3;
import '../dataLayer/dataSourceContract/dataSourceGetCityWeather.dart' as _i4;
import '../dataLayer/dataSourceImplementation/DataSourceGetCityWeatherImp.dart'
    as _i5;
import '../dataLayer/repositoryImplementation/RepositoryGetCityWeatherImpl.dart'
    as _i7;
import '../domainLayer/repositoryContract/RepositoryGetCityWeather.dart' as _i6;
import '../domainLayer/useCase/DailyWeatherUseCase.dart' as _i8;
import '../domainLayer/useCase/getCityWeatherUseCase.dart' as _i9;
import '../domainLayer/useCase/getWeatherByLatAndLonUseCase.dart' as _i10;
import '../presentationLayer/ui/cityWeather/cityWeatherViwModel.dart' as _i12;
import '../presentationLayer/ui/DailyWeather/DailyWeatherViewModel.dart'
    as _i14;
import '../presentationLayer/ui/otherCitiesWeather/otherCitiesWeatherViewModel.dart'
    as _i11;
import '../presentationLayer/ui/search/searchViewModel.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.DataSourceGetCityWeather>(() =>
        _i5.DataSourceGetCityWeatherImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.RepositoryGetCityWeather>(() =>
        _i7.RepositoryGetCityWeatherImpl(
            dataSourceGetCityWeather: gh<_i4.DataSourceGetCityWeather>()));
    gh.factory<_i8.DailyWeatherUseCase>(() => _i8.DailyWeatherUseCase(
        repositoryGetCityWeather: gh<_i6.RepositoryGetCityWeather>()));
    gh.factory<_i9.GetCityWeatherUseCase>(() => _i9.GetCityWeatherUseCase(
        repositoryGetCityWeather: gh<_i6.RepositoryGetCityWeather>()));
    gh.factory<_i10.GetWeatherByLatAndLonUseCase>(() =>
        _i10.GetWeatherByLatAndLonUseCase(
            repositoryGetCityWeather: gh<_i6.RepositoryGetCityWeather>()));
    gh.factory<_i11.OtherCitiesViewModel>(() => _i11.OtherCitiesViewModel(
        getCityWeatherUseCase: gh<_i9.GetCityWeatherUseCase>()));
    gh.factory<_i12.CityWeatherViewModel>(() => _i12.CityWeatherViewModel(
          getCityWeatherUseCase: gh<_i9.GetCityWeatherUseCase>(),
          getWeatherByLatAndLonUseCase: gh<_i10.GetWeatherByLatAndLonUseCase>(),
        ));
    gh.factory<_i13.SearchViewModel>(() => _i13.SearchViewModel(
          getCityWeatherUseCase: gh<_i9.GetCityWeatherUseCase>(),
          getWeatherByLatAndLonUseCase: gh<_i10.GetWeatherByLatAndLonUseCase>(),
        ));
    gh.factory<_i14.DailyWeatherViewModel>(() => _i14.DailyWeatherViewModel(
        dailyWeatherUseCase: gh<_i8.DailyWeatherUseCase>()));
    return this;
  }
}
