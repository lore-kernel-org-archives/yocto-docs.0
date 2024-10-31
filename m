Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8D1D767EB
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:56:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.17358.1730393792741937816
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jUxODVub;
 spf=pass (domain: baylibre.com, ip: 209.85.221.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d49a7207cso835569f8f.0
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393791; x=1730998591; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=jUxODVubHT/OBLQzEAlRFmdtgKvtNQdpnkRGk+KapDD18i2uK+VXjteQUAYqy0zGlV
         +IRuT9kGf5f4lxA9Sh2F/G1tBakVthE+StIaGDzNkaxP4HLczWkKy2bVZr7Ev/VyT8sH
         uP0D2tYPAhWUp8umitYZF8XHTj2nm8gTP6RSc5lrLQ7K1WrUyps1ucFtBDHR1oPlDZwW
         XZZdHdDmGjod0miQsqOk1qNniU8V/F5AWfQtEMm1QZX1fxdQWubhPioxxwi/I3jEg14C
         dsLV/UDFTkisulNGJwAx6RDG5h2J5RwUrqo/+VQgNm0o4vBdvBktAt0Me8yAoVUnWNxK
         zK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393791; x=1730998591;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=oS60j4E9VY+z35zSZh7OtHUTlfg4N+aGzbnweCA9ix86l1KKZEG1S2LZlLnR3E1J7o
         WeS62Uirrx+voM3NMbiK6AxA+iglwDE6cqpYQgOrL7ODT6v9mWgJTjotL6IJEPEIaHZw
         JmgeFuxOPxpqefxtoiujoiffEq80EvZ5VuGuYZUa8D4d0VB0Ly3voy26ktk5bSwtMqD+
         METobFEvsieVK+gIA+6i2L5byVsMGSmZ8Buo5DCcKu5ipFMe5xMpkgV/QIme1of4ZtuD
         DoC+NMCfw0vryOh9mboy3ANwXN5vazSWzH7Uy9bhH9H1EhhrQunJ7YPbMLRdZuu7aSd7
         JJAw==
X-Gm-Message-State: AOJu0YyIJ/XVTaXKtiJY+kudFGEAJh3mciPWmDbKc136YoxPacvP1lWT
	T7vVnLb2pS4YiPUdYh+PhANK41BxHt/cM0ptXVP7puSGqoCHxLBvG0fnT6gDIfDhLut3svMUIuA
	Yboo=
X-Google-Smtp-Source: AGHT+IHjzoKf7V91hX9rC3JBH7vd4QQVLIg1gLmuUr4OzQWn1dtFedmFGM1M3VsgtDIPch7PG0WbAQ==
X-Received: by 2002:a05:6000:1faf:b0:37d:43f1:57fd with SMTP id ffacd0b85a97d-381c7a3a6a8mr564457f8f.6.1730393791195;
        Thu, 31 Oct 2024 09:56:31 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e747csm2660525f8f.64.2024.10.31.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:56:30 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 17:56:18 +0100
Subject: [PATCH 3/5] styles: vocabularies: Yocto: add sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-add-bblock-documentation-v1-3-32b89093bbda@baylibre.com>
References: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
In-Reply-To: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5639

Add sstate as an accepted word to avoid errors when runnign make
stylecheck.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/styles/config/vocabularies/Yocto/accept.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/styles/config/vocabularies/Yocto/accept.txt b/documentation/styles/config/vocabularies/Yocto/accept.txt
index ca622ba41274c892f1fc1e16d8332a02f07a3531..7fedda8ae23c22f3660292faa0a1c3df23da353e 100644
--- a/documentation/styles/config/vocabularies/Yocto/accept.txt
+++ b/documentation/styles/config/vocabularies/Yocto/accept.txt
@@ -2,4 +2,5 @@ BitBake
 BSP
 crosstap
 OpenEmbedded
+sstate
 Yocto

-- 
2.47.0


