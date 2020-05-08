//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `lose.mp3`.
    static let loseMp3 = Rswift.FileResource(bundle: R.hostingBundle, name: "lose", pathExtension: "mp3")
    /// Resource file `win.mp3`.
    static let winMp3 = Rswift.FileResource(bundle: R.hostingBundle, name: "win", pathExtension: "mp3")

    /// `bundle.url(forResource: "lose", withExtension: "mp3")`
    static func loseMp3(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.loseMp3
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "win", withExtension: "mp3")`
    static func winMp3(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.winMp3
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `ScoreCell`.
    static let scoreCell = _R.nib._ScoreCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ScoreCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.scoreCell) instead")
    static func scoreCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.scoreCell)
    }
    #endif

    static func scoreCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ScoreCell? {
      return R.nib.scoreCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ScoreCell
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _ScoreCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "ScoreCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ScoreCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ScoreCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let gameEndVC = StoryboardViewControllerResource<GameEndVC>(identifier: "GameEndVC")
      let mainVC = StoryboardViewControllerResource<MainVC>(identifier: "MainVC")
      let name = "Main"
      let scoresVC = StoryboardViewControllerResource<ScoresVC>(identifier: "ScoresVC")
      let selectDifficultyVC = StoryboardViewControllerResource<SelectDifficultyVC>(identifier: "SelectDifficultyVC")
      let splashVC = StoryboardViewControllerResource<SplashVC>(identifier: "SplashVC")

      func gameEndVC(_: Void = ()) -> GameEndVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: gameEndVC)
      }

      func mainVC(_: Void = ()) -> MainVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainVC)
      }

      func scoresVC(_: Void = ()) -> ScoresVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: scoresVC)
      }

      func selectDifficultyVC(_: Void = ()) -> SelectDifficultyVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: selectDifficultyVC)
      }

      func splashVC(_: Void = ()) -> SplashVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: splashVC)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().gameEndVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'gameEndVC' could not be loaded from storyboard 'Main' as 'GameEndVC'.") }
        if _R.storyboard.main().mainVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainVC' could not be loaded from storyboard 'Main' as 'MainVC'.") }
        if _R.storyboard.main().scoresVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'scoresVC' could not be loaded from storyboard 'Main' as 'ScoresVC'.") }
        if _R.storyboard.main().selectDifficultyVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'selectDifficultyVC' could not be loaded from storyboard 'Main' as 'SelectDifficultyVC'.") }
        if _R.storyboard.main().splashVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'splashVC' could not be loaded from storyboard 'Main' as 'SplashVC'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
