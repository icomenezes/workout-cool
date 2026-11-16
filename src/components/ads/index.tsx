/**
 * Ads were removed from this self-hosted fork (no AdSense / Ezoic / sponsor or affiliate links).
 * These no-op components keep the existing call sites compiling; delete the call sites when convenient.
 */
import type { ReactNode } from "react";

interface AdSlotProps {
  adSlot?: string;
  ezoicPlacementId?: string;
  position?: "left" | "right";
}

interface AdWrapperProps {
  children?: ReactNode;
  fallback?: ReactNode;
  forceShow?: boolean;
}

const NoAd = (_props: AdSlotProps): null => null;

export const AdWrapper = (_props: AdWrapperProps): null => null;
export const AdBlockerForPremium = (): null => null;
export const HorizontalTopBanner = NoAd;
export const HorizontalBottomBanner = NoAd;
export const VerticalLeftBanner = NoAd;
export const VerticalRightBanner = NoAd;
export const InArticle = NoAd;
