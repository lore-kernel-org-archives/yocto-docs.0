Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.3010.1606384117947933000
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2020 01:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=buafFPhZ;
 spf=pass (domain: linaro.org, ip: 209.85.128.68, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f68.google.com with SMTP id g25so199177wmh.1
        for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2020 01:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9i6tPFj2OAXL7L21h0ilbFAsdVOWKVVdFmjGvAwmkFw=;
        b=buafFPhZOgtkER4LFrE8oqN8Oq9DufjBrcnOR0quXLMCg9f6fDmoutfs0XhiXYbpp+
         DvNe6O4m9F6H58oxdvxpOeAtf0zYb0AoPwK1BuFKp87nZH6o82DDBaN4+vhr8bXamn5G
         ZMjBNPxRkyyOhkrVH5Z7hGZREpgvbgL7DmFAST0/ThKeETP0KHXLB2ENVgt+CXDPlUpe
         fzXKn4Q18x3KURl9hciTgc3hGAxDbdXEMYbXUS13wvX4TPsKeTLnDhIU15naFZOgRlgA
         zxaFRSbCcP2PkQ48QKwojjZsWpsTgoXbhFsl8/DRBSxXzB7041Q4j2Kk7dCbTLLNeixj
         6rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9i6tPFj2OAXL7L21h0ilbFAsdVOWKVVdFmjGvAwmkFw=;
        b=dYr8eg4sRR/WPohVM0DsbRCW9vVUxfuxZgAB8UPraEQJe55PDfnGmV9ia1daxcreDy
         jtyJCuUGAgrR7EMqmT2vsgZTnu8gcnE/bDmxHLsAovpsi8cPhpw9q36EMg+CLLMAbZsl
         wfuHycF6TkAmSug9eDEe0Eg0pfiWpmN9uxpxfu3XbUgoQYW9C2R2EKrk+v8vTMh744Nc
         oZmCYSrb+XryYOnMxCtxOhS4evsEt55OKOMnLqhTiDTwDbhtnFJ3D73RvUmzlxzyLflm
         Ea8KjtjigLsrzSJXkV3xVnl8Sb++2wEDtmUQ7hP1n0uwCcd18qQaT0DSNkmIrEbytsqM
         zJRw==
X-Gm-Message-State: AOAM530T7hW3DPgJiKPiwCrBWhSB7f7vMAmuWR0Q7yjVlW7uZUk49jp8
	HbA5LlUXpi/4G5b8qaezNwvW68/ve1Wqs9TC
X-Google-Smtp-Source: ABdhPJyFhC7ULAxesy56xMYxWtJSNJVlbwD8tVoHT5vTgkIpJQF8y2e8wevBIHUep9MpeXmjMCwoEw==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr2341303wmh.119.1606384116111;
        Thu, 26 Nov 2020 01:48:36 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id a12sm8759590wrq.58.2020.11.26.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 01:48:35 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 0/7] A second pass at removing labels
Date: Thu, 26 Nov 2020 10:48:20 +0100
Message-Id: <20201126094827.95641-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a followup series similar to:
https://lists.yoctoproject.org/g/docs/message/659

I have now removed all labels from dev-manual and overview-manual. I
am also preparing the removal of labels in the bitbake manual, I will
send the patches when this series is merged.

The only manual that still has labels is ref-manual, but there the
labels are heavily used.. and many section titles use backquotes, so I
will wait to see what we do with that. If we remove them, i think it's
better to do that first, then remove the labels.

Nicolas Dechesne (7):
  sphinx: replace bitbake labels with references to corresponding title
  brief-yoctoprojectqs: replace labels with references to section title
  dev-manual: replace labels with references to section title
  ref-manual: replace labels with references to section title
  sdk-manual: replace labels with references to section title
  overview-manual: remove unused labels
  dev-manual: remove unused labels

 .../brief-yoctoprojectqs.rst                  |   4 +-
 .../dev-manual/dev-manual-common-tasks.rst    | 245 +-----------------
 documentation/dev-manual/dev-manual-intro.rst |   2 -
 documentation/dev-manual/dev-manual-qemu.rst  |  14 -
 documentation/dev-manual/dev-manual-start.rst |  10 -
 .../kernel-dev/kernel-dev-advanced.rst        |   2 +-
 .../overview-manual-concepts.rst              |  46 +---
 ...verview-manual-development-environment.rst |   6 -
 .../overview-manual/overview-manual-intro.rst |   4 -
 .../overview-manual-yp-intro.rst              |  22 --
 documentation/ref-manual/migration-2.3.rst    |   2 +-
 documentation/ref-manual/migration-2.6.rst    |   2 +-
 documentation/ref-manual/ref-classes.rst      |  16 +-
 .../ref-manual/ref-devtool-reference.rst      |   6 +-
 documentation/ref-manual/ref-features.rst     |   2 +-
 documentation/ref-manual/ref-structure.rst    |   6 +-
 documentation/ref-manual/ref-tasks.rst        |  32 +--
 documentation/ref-manual/ref-variables.rst    |  78 +++---
 documentation/ref-manual/resources.rst        |   2 +-
 .../sdk-manual/sdk-appendix-obtain.rst        |   2 +-
 documentation/sdk-manual/sdk-extensible.rst   |   2 +-
 21 files changed, 94 insertions(+), 411 deletions(-)

-- 
2.29.2

