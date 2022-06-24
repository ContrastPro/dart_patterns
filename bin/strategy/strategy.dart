void main() {
  final UIImage uiImage = UIImage(image: "test/picture_1");
  final Filter filter = Filter();

  // No filter
  filter.filterStrategy = NoFilter();
  filter.applyFilter(uiImage);

  // Purple filter
  filter.filterStrategy = PurpleFilter();
  filter.applyFilter(uiImage);

  // Yellow filter
  filter.filterStrategy = YellowFilter();
  filter.applyFilter(uiImage);

  /*List<FilterStrategy> filters = [
    NoFilter(),
    PurpleFilter(),
    YellowFilter(),
  ];

  filters.forEach((element) {
    filter.filterStrategy = element;
    filter.applyFilter(uiImage);
  });*/
}

class UIImage {
  final String image;

  const UIImage({this.image});
}

abstract class FilterStrategy {
  UIImage process(UIImage uiImage);
}

class NoFilter implements FilterStrategy {
  @override
  UIImage process(UIImage uiImage) {
    print("Original image: ${uiImage.image}");
    return uiImage;
  }
}

class PurpleFilter implements FilterStrategy {
  @override
  UIImage process(UIImage uiImage) {
    print("Purple filter added: ${uiImage.image}");
    return uiImage;
  }
}

class YellowFilter implements FilterStrategy {
  @override
  UIImage process(UIImage uiImage) {
    print("Yellow filter added: ${uiImage.image}");
    return uiImage;
  }
}

class Filter {
  FilterStrategy _filterStrategy;

  set filterStrategy(FilterStrategy filterStrategy) {
    _filterStrategy = filterStrategy;
  }

  void applyFilter(UIImage uiImage) {
    _filterStrategy.process(uiImage);
  }
}
