{-# LANGUAGE OverloadedStrings #-}

module App (app, MySession(..), MyAppState(..), MyApp) where

import           Control.Monad.Trans           (MonadIO)

import           Network.Wai.Middleware.Static (addBase, staticPolicy)
import           Text.Blaze.Html               (Html)
import           Text.Blaze.Html.Renderer.Utf8 (renderHtml)
import           Text.Blaze.Html5              ((!))
import qualified Text.Blaze.Html5              as H
import qualified Text.Blaze.Html5.Attributes   as A
import           Web.Spock


data MySession = EmptySession
data MyAppState = DummyAppState

type MyApp ctx = SpockM ctx MySession MyAppState ()

blaze :: MonadIO m => Html -> ActionCtxT ctx m a
blaze = lazyBytes . renderHtml

checkoutView :: Html
checkoutView = do
  H.html $ do
    H.head $ do
      H.title "🙂 Spock + Flow"
      H.meta ! A.charset "utf-8"
      H.script ! A.async mempty ! A.src "/js/index.js" $ mempty
    H.body $ do
      H.p "Hello, world!"

app :: MyApp ()
app = do
  -- Will serve files from public as if they were at '/'
  middleware (staticPolicy (addBase "public"))
  get root $ blaze checkoutView
