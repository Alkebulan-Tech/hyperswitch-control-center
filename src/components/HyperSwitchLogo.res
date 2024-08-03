type theme =
  | Light
  | Dark

@react.component
let make = (
  ~logoClass="",
  ~handleClick=?,
  ~logoVariant=CommonAuthTypes.IconWithText,
  ~logoHeight="100px",
  ~logoWidth="100px",
  ~theme=Dark,
  ~iconUrl=None,
) => {
  let iconFolder = switch theme {
  | Dark => "Dark"
  | Light => "Light"
  }

  let handleClickEvent = ev => {
    switch handleClick {
    | Some(fn) => fn(ev)
    | None => ()
    }
  }

  let iconImagePath = switch logoVariant {
  | CommonAuthTypes.Icon => `/assets/${iconFolder}/hyperswitchLogoIcon.svg`
  | CommonAuthTypes.Text => `/assets/${iconFolder}/hyperswitchLogoText.svg`
  | CommonAuthTypes.IconWithText => `/assets/${iconFolder}/hyperswitchLogoIconWithText.png`
  | CommonAuthTypes.IconWithURL => iconUrl->Belt.Option.getWithDefault("")
  }

  <div className={logoClass} onClick={handleClickEvent}>
    <img src=iconImagePath className=logoClass style={{width: logoWidth, height: logoHeight}} />
  </div>
}
