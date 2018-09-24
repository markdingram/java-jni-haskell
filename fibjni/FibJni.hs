{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StaticPointers #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE UndecidableInstances #-}

module FibJni where

import Foreign.Ptr (Ptr)
import Foreign.JNI.Types(JNIEnv(..),JObject(..))
import Fib

fibJni :: JNIEnv -> Ptr JObject -> Int -> Int
fibJni _ _ x = fib x

foreign export ccall "Java_fib_FibMain_fib" fibJni :: JNIEnv -> Ptr JObject -> Int -> Int
