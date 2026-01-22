Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CAED3EE9F
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:55:11 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43213.1769104503038511620
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 09:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C2sMFWiR;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5014b671367so13094381cf.3
        for <docs@lists.yoctoproject.org>; Thu, 22 Jan 2026 09:55:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769104502; cv=none;
        d=google.com; s=arc-20240605;
        b=ew/mlvSG3GfS0SmDq2OXl2hmaOhhh5mse+fM7ZzM3h7Ctty2rOPbzSwEtsh10l6wg0
         OQsW+a4tTS/6NiX/yME6RHvtLDv2zcdU/ZqJgFnl6pgpIoTwMj6V4GaTTzlHyR78qjKL
         m5Lab4xsnVIft0VBjxpj09wpuQPfvQlbAyQfpdWDgtiryuk7s5JBdLxywwcn6kVqasj0
         qG41v7hOn6lGI0d4s7R7b/+bXZJlYCSXmPGPuCYf/ZqmgxIQhgQ93cmaomNpmR3YGImE
         qz28gTRqxhM3KqP5SlTbd1loDEDVJgwpxHU3nVQjpF86ApFoPsozCI93IJz1eOTbkgxV
         2Phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6nue6nmU5mXdC5K4QDrTfm9FnLMNFMqwdEXJ/cKPSv8=;
        fh=nZhEklYLBz4e7ejrT5lK46ggJ1K0Z9H1zC9khG0/sps=;
        b=MdS9WYFF01UBdhY9bH3q8miqkasb5hzMUZoMP7AecxRRgHIjpE5qzeP57HUGbmLvok
         ZxDPjpD0uFIIKTxIx3Xyr6upstew5osbL03ubBuzpxYxyQO4uM4tRWlJeAbv9FbkI2Sx
         YnHyEtPDhL4kOqXBPm4TcF/Jg+0JXcmKxCB1dNHpYhKGibJj+ml/opAuH/XN4ERczZRo
         mn8viKRC9JVeGx+QcMZBfEli/qkBbRwYYFY+XnsPFrhAyxKEZN1ZzlXcgq1HY46t6V5b
         dp8vQfZMEnyE08yWetf48ELV6ck2Gu4gwyMX6Adp+pgWjXnFlWJb6fUgZJDRVwvqGPXv
         GF9A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769104502; x=1769709302; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nue6nmU5mXdC5K4QDrTfm9FnLMNFMqwdEXJ/cKPSv8=;
        b=C2sMFWiRuaIkZESu2eNzaUlb2g6HNIf4L2EMsCR3iXdkAXvl7sL2EGJmVMakswmlMZ
         WKIpjMLOQ8+bjy2emKLJu2PJEsls1mLKpRdbbXL5Q1vjdsXSN9EfQ9N3GgNpx4jOWCbH
         zqSEV+wcTaRlFPO4sYh9EEmrLcviG9t1rfceHSWLV7ucuzqIT9GxCViCWhnRFQHiAk9+
         pz1NP+ZUDHRCnvt72EuhJ5HjYQr7zBsRIv+jkBeXDPXMUj3AIYviuBzXIziFgsGXx0Vb
         vSX4h2yqEk6Tbe4w88XHqw187rGejHTOwyeaN81u3oD/+gCYTluDlXmmMu8lGYgG+x93
         6ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104502; x=1769709302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nue6nmU5mXdC5K4QDrTfm9FnLMNFMqwdEXJ/cKPSv8=;
        b=RiFf481p/tQEU0Vn2dgX7ruT24ObhW5syZl3PuTF6xUpNZdxrnoAUsbtc1+nb5xNYa
         4QA4zmAIYomcr/D0ybp//iSjw0EJJDJ+Jsc4gIals2jA4Nt3nJJIy8bMYb5b60fffgRM
         bAY+FqL09XMj2FLODTNHikmRua84kIiFLdb38eSnN/bN11oigh8IvFfpabr/Wle7SoKw
         0wibfQl/jbqacqASZjBhD5uGy5epUFtfxofEgrP/1LinJvXeue2dPCehOqCGfYAN2QEz
         FXRzgIoJBK2NBabHXKLzZtxVS8bzVPGVL1VJur5eSf4nGEmqCO3DqxrO3NnIyhk8gp/O
         NFaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/iqS6LKgs8hFLMCLY53vAql1Xv2EoWIT0Jlv3rj1ZvxFBtn4Z6dXI2t3goydIUkGTBrAe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy9qaobQvcjdGz/IYqpuTtjDCCGEv9yXGBkmRlgHoul7u+tEMmt
	zfwCz0s34tBkU3mXdzpF15lKd2Be2Zw51kzyuq1TQL1jDmSNwuI1RELyEjpXXc7G1akWw1araIE
	N6tZPi2rPMjAmpbehrgiSkaRf+inDzdU=
X-Gm-Gg: AZuq6aJIWm3/fMG7t/D1khKYjuh8NsAqB2ypR8M7dk+B+qnGhDWAsxK59+mhaymsHqJ
	KARFYL8BdSZGNyXtWP0zbvuA9R+o9g2OHygcxveYcyCNdUr85pJDO98uizoTaeVfuoUXHXdrSm+
	s9cdHXTzHZLk0iIjQxccp12FFPCgRH+P7oswVrSyK1n5FQeefG4iTky6szOOMuQ/2FKcmvqTLHc
	F5RJ13MVTPvDW2vdcfZJOuGoeG0AYc58bQVSmezNtLM+U5Zt0rKadoNEK2S7Prq7l7KITmQVCu+
	kAE/PPbyHAStWaJzW8bgrETpv33G/yNB4nLL7yNj
X-Received: by 2002:a05:622a:44d:b0:4ee:1b0e:861a with SMTP id
 d75a77b69052e-502f772500cmr6356921cf.13.1769104501970; Thu, 22 Jan 2026
 09:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20260122-bitbake-setup-choose-builtin-v3-0-c55291acc1a7@bootlin.com>
 <20260122-bitbake-setup-choose-builtin-v3-3-c55291acc1a7@bootlin.com>
In-Reply-To: <20260122-bitbake-setup-choose-builtin-v3-3-c55291acc1a7@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Jan 2026 18:54:50 +0100
X-Gm-Features: AZwV_QjO-jYNQXari-fVIBaJhP-1xx7vE748q_nwOSbT8drWAnNQtjwT2e8z538
Message-ID: <CANNYZj_SUcRFLWobRO9GHPzN+ZtG9koKVg4iZ-gzoKsSAUiMoQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] lib/bb/tests/setup.py: add tests for oe-fragments-one-of
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 22 Jan 2026 17:55:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8631

On Thu, 22 Jan 2026 at 16:02, Antonin Godard <antonin.godard@bootlin.com> wrote:
> +            },
> +            {
> +                "name": "gizmo-fragments-one-of",
> +                "description": "Gizmo configuration using oe-fragments-one-of, both formats",
> +                "oe-template": "test-configuration-gizmo",
> +                "oe-fragments-one-of": {
> +                    "fragment-desc": {
> +                        "description": "Test fragments (with description)",
> +                        "options" : [
> +                            { "name": "fragment-desc-1", "description": "fragment 1 desc" }
> +                        ]
> +                    },
> +                    "fragment-nodesc": {
> +                        "description": "Test fragments (no description)",
> +                        "options" : [
> +                            "fragment-nodesc-1"
> +                        ]
> +                    }
> +                }

To avoid multiplying test configs further (and making the tests
slower), perhaps this can be added to gizmo-notemplate, and that
renamed to gizmo-notemplate-fragments-one-of ?

> -                                                                 'gadget-notemplate','gizmo-notemplate')},
> +                                                                 'gadget-notemplate',
> +                                                                 'gizmo-notemplate',
> +                                                                 'gizmo-fragments-one-of fragment-desc-1 fragment-nodesc-1')},

As there's only one choice in each, bitbake-setup should pick that
without asking, or having to specify them on command line. Let's test
that too, and drop the fragment names from here.

Alex

