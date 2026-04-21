Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D3AF94CA9
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 19:36:22 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46158.1776800178181029245
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 12:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dlxd96IM;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: twoerner@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a402b2d102so5351535e87.3
        for <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 12:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776800176; cv=none;
        d=google.com; s=arc-20240605;
        b=eV18jTCiADRzkM6Hhwu/EDtwjiEo8mSMOYMI8Fu24NBZCJoaWGbX9THMaxYFg4plyz
         AUImWmoIUfNBcuFt4cUkRJKamQyaSvAUMdsVE45ECerHFcMK9IAHjlxJmNyfpkj0PPiR
         IeV7qrAoEf18IioPZ1G6QP1RkvYidO8sbBI3ke6/pSpBF43XBBrTr+HPrcUc4VjMQglu
         LS+CwGbKeKjStc2vxJpFl9VQH+eKP9dldExRnIPB03WgcosBx3kV6LlRh8/H7S8ioHlR
         wNOPYqvQg63v52MYMhdpjMf9/GLEbTLaChGbHN3AiizyDZS7ajy5sJNkkXr8ecgS8wQ3
         qYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PXqinVPNVeN1b0sfnZmfUPvw/whIa2r5biwca4T+baY=;
        fh=seq8tdoRi9bIRFtUfJsiaEWcf4SphnhXphjskWBeTW0=;
        b=WGIwuth6NVbK0N/2KLMGu69/C5EaLBMzyyVlwulyGsmG5qRBhWvimnFpDu7Qo8IA3V
         DLIqffHer1pcztOVfesWsswu53ikX6giXuyWjSb3PO1aXriu+4x+vfQ8xd6TrN38k614
         OJMSUFakQTobbXdDk1nzazo5bSebXECRemEwfsdRT4M1IDWL3Rxhlt6Hdcz6sOJzVbYg
         E0Pt1/+Mo9Ltv/eU5v85uKxJ9ESpAPpwjM3H4XsJVc0h0nKt4H66pYIWefvl+GUERnjH
         w2DF5B7SXszEn94zh2BMx8r52f8339OPIQr/MnehUNFXMZ+iGAI/oVlGi6jLV8QHewoc
         axcw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776800176; x=1777404976; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXqinVPNVeN1b0sfnZmfUPvw/whIa2r5biwca4T+baY=;
        b=Dlxd96IM98y9L3NXSJBhsACHEaYO+6DWssPOIii6E6hByCPViRjr8QQsI1IcUirAgh
         vhG/Soiak78ke2OwOdsiGzqg9Wyf/iGO9d5cX5Dad3ozKcylYMKYqvwnt2gBCqAHS6Je
         0yJwTteNV6dTegRyefuHs0ELxMp1CPYCYx0pxrXhv2oEwnpF0YE42fQIrTfvgKkOrkKv
         aHJTE3Icd4GeX5IJA0uwpRoHulyayLA0F1/pqUMZP09YSIL0FJ0Yg6h144E+Y/AvLWfd
         T3ft/9kGfUGJAIlOBWcR2Rp8vJMO3K19rwHmGLBa9NPZivlr3FTvjdydeVS9B2qXrOH3
         6vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776800176; x=1777404976;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXqinVPNVeN1b0sfnZmfUPvw/whIa2r5biwca4T+baY=;
        b=H+5SVBnu9uxFduaDpPtTszwlW7kEAbiVzYXnMAIKVSsLqDpF9DazpvYLhOyvspxUvq
         +BKO54fJJ5nSn8EdCOoUXBmoitOdps8QP+CTvvLQKfp4jegZxyUaKwesleSyTuAQbNsw
         9zjURITcVw1j4yQT1K1OMQrAfgN0Z8IjGB5QEJaVE/VDq1tufJmCPaK9/ZRR4runtwN3
         4Ryl/H0ryoX9owg7sPgMKv48FadeVK19fbsoOXzMkF0JkMfigCM3wXIaRaVJft/pA2ru
         Z2sCkK3ZUyBT4V1ivqXOg1XmDKpkH21rFvJ9ueZIg2Ienr/e0VUMwm0Ao+0bMr3s70AL
         4mwQ==
X-Gm-Message-State: AOJu0Yxja5SE1Jr+mAa8DzXaYoB0BTycMaMkVSo2JMzpxmTHIqx030K+
	jdjaF/Tubja7a7vQeyOaRCy08PF7NAErteU8bXqo1qpASeb1+cLEMlmDr9ZjRKaZ+f2yrV8QS65
	jQtLdUoi0bilIMMl+rYZZUtlwK1jprlyu/A==
X-Gm-Gg: AeBDieukwBiXq7NPZQfy+AjHBI9M6ji/DbJQEIPnHaNGToffq4A7jXrYeskKEybuTWR
	HP8BQjpFF42r/MjlQQIVvBqzStIDILGBIwLtoUr6R/yXYVwSGk+L6U1ezxtgtRi6+322/z5NZ9s
	wY1Xf8cJeNaPnVbhQ32a1pTTQCHsLbtHRRRMnhuK0gP3nlZTKk+ALggqiCLKGe3KdHE0BaJdZc6
	vlvBHLFttr+MGa9QsNRxjZxRs+4mtj1PWXJBjS8Spc9CpdeQuhJq18PiBq7zwfRsGN9/TAbpPy2
	4pRVScfwZ9UmZMTzExs=
X-Received: by 2002:a05:6512:3d20:b0:5a3:ff44:f019 with SMTP id
 2adb3069b0e04-5a4172ca21dmr7774189e87.11.1776800175282; Tue, 21 Apr 2026
 12:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260421172416.1801567-1-twoerner@gmail.com>
In-Reply-To: <20260421172416.1801567-1-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 21 Apr 2026 15:36:03 -0400
X-Gm-Features: AQROBzAc92zGwU_l4XvVHWoD_9rTbp4InehOHgLoU9pjmyLifrVdewaIGrZkU9Y
Message-ID: <CAHUNapRCdBBdCMYZaT_X_HWLsv5JgN8Ewd8mTcCUKf_7qdY=pQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] support bitbake blocks
To: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Apr 2026 19:36:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9303

Hello docs people!

In today's YP tech call I mentioned that I had been using reST/Sphinx
extensively recently and had a couple updates I thought might be
useful to the project. I have submitted this RFC patchset to gauge
interest in this proposal. If you like it I can submit a full patchset
with updates for all document.

Thanks and best regards,
    Trevor

