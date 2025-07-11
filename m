Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18A5C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 17:10:09 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.19077.1752253808124156384
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jul 2025 10:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cPBmUFRI;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6facacf521eso19566436d6.3
        for <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752253807; x=1752858607; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GkHQIKHuxhFjGYUbMzH61qN0X8HgtGwD/hMKCMDxuSI=;
        b=cPBmUFRIDiqebWdl8WeGs8P/JaY7mmQwGxD4yppBbOOaig+aFle9jf4l+zaCONx88P
         yNijte6I+Zys5oaOLbkvQSIvidTh66b+inBlTTuMT63AZxtIFuWozstJHfgLHHuVMKXj
         yeGxtG7apPv6rBJkS1YSV61Sh7IXs0bmoHOay2X16Br/COp/TIV+rUund8wT/Xivpqbz
         q+QJJcgYnwU403EaUgLpQPcpBQISoNWwVoWC4859L01YA4z8MqStQhexBPE/O/4gBM1b
         KRlbIwVzgX0wDg2rr3MbjxFEzkKgARZwOwQrczz0YzoDbx4X2zxk2FJVoJtcxZmcj6Ma
         VFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752253807; x=1752858607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkHQIKHuxhFjGYUbMzH61qN0X8HgtGwD/hMKCMDxuSI=;
        b=KuCiEFmlnd9dyIFv4jJ/HuG7mdCtt4nxRgymDr5VoE17voNVpf9K3MgNuh9MKQCe4C
         KSGve4ZLtRAiwyNiD30nrNivyhpeETrM2lBvilLuggg/LFJbkQuF6TsX5MVuTCIWSvv5
         Wd0orpj5ZY/O+7OtpFiJlrMAlkAg5x/Jdtw4FUxlbVYs3OEhEIZLdKfLhxXC+bcB+BU5
         Gilp5jRek621gZ0XibaHwTYv1kmxkLtzX8VxmIhbK//209tzOt/7IHaG5woHkEKLUln+
         Q3+yMoZ7UKB3LKAu4wWAh3pACslLcpn2MOIjHuItvqjXLyOFVXlpjof0g5Ap7j4DGS2L
         qvXw==
X-Gm-Message-State: AOJu0YyY5WAEWzCio/2z/68G+g3xlh6Q4ZufNt0xvuR3HyZn82/UiUC8
	RgwmA8xzuAB73OkrQO/k3tEAiKhGPMfVC1JQgJ5wCwvgWyGRpe49/xG3NLIUYRMDegoUHHuZEeb
	qoRd7+JDbNVHW93YEnbO+8JadTC6EGx+mdg==
X-Gm-Gg: ASbGncvocftCphVmGXFab/Sd10mMKLsZQk/ABuNLOMJtGE+055XPV1lpy496dSt9fht
	3aXx8yuFcojHFatv80NInq5XtECM6B6k9J7HozWewtgaWvc8zcPR8JBpd3sMDV191MCum+g6gRa
	LrCaaCthEail0aF6DAZ0K3MWblXCPY9c7jBow9N04SeKVE/SLHyoU4FYXzsL8k9vcsXocr8ouuh
	Yuh/Graam5+ANvt4TGowhTb4yE7M0u9C5BQvrk=
X-Google-Smtp-Source: AGHT+IHEPyzrEffLXr2LS0tf0wYux1cFOA9kRRFQ01/icTzOnyyJZRpcZDNVNoLM3HCz30M+FcMxFRDgz2nixCScR2A=
X-Received: by 2002:a05:6214:2626:b0:704:8c06:a6ef with SMTP id
 6a1803df08f44-704a35fe88amr76138536d6.15.1752253806905; Fri, 11 Jul 2025
 10:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-update-sstate-dir-docs-v1-0-9114688f33d1@bootlin.com> <20250709-update-sstate-dir-docs-v1-2-9114688f33d1@bootlin.com>
In-Reply-To: <20250709-update-sstate-dir-docs-v1-2-9114688f33d1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Jul 2025 19:09:54 +0200
X-Gm-Features: Ac12FXyYvyy8HfuuuUQ8K4PtIKyznPw0q4InFpGB5alwCCLJ20Ocx1zbdwdifLU
Message-ID: <CANNYZj-4mUU9Beoz95ekGRwvGTUV9zbXqd3w2z7pU_na6qYLtA@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/4] ref-manual/structure.rst: update with info on PERSISTENT_DIR
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Jul 2025 17:10:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7316

On Wed, 9 Jul 2025 at 09:57, Antonin Godard via lists.yoctoproject.org
<antonin.godard=bootlin.com@lists.yoctoproject.org> wrote:
>
> Since we mention that SSTATE_DIR can be shared for multiple builds, also
> mention that PERSISTENT_DIR should be shared alongside SSTATE_DIR.

NO. These changes are incorrect, please do not merge or revert if
already merged.

PERSISTENT_DIR can be copied from one build directory to another when
bitbake is not running, but it cannot be shared between two active
builds.

If one wants to share sstate, they either have to setup a hash
equivalence server (and then sharing PERSISTENT_DIR is not needed), or
disable hash equivalency (in which case it is also not needed).

Alex

