Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECF6C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 23:05:40 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.316.1714172735571617918
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 16:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ar2zpwjT;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61b92a83216so31106467b3.2
        for <docs@lists.yoctoproject.org>; Fri, 26 Apr 2024 16:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714172734; x=1714777534; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eR+2BKVfIQ6asNRHHcYrJ8Y7qY80A25xbM2Npp+gBUU=;
        b=ar2zpwjTkDqtCbh/S9i/e/8hApfaPYwuuKBJQCVnthgNLcVzsl83fKbUsNVuOw7gHW
         5nAO2EF/vJ5T4GlBw6jXlmzqJaRzyxyU8xvhweNRfyPeYGyzbQWnegttDKSFkHA5xrHW
         PpZHDDEqRR+jfe3+ZfUEhMmD6JhmdpvyCtVTqAqDv9ygwuB6OZxD3bBxVehFYNC7ZjD5
         rC4MTvkay1QfeDxk05bYfznDZ7uFh4lxdBKkF0eKnThHYLZOs4b7AfHziiOpcSoZ99N3
         SYFIdLb85jAlFX/ElP6umkhznbpytlSgnsQLyEojXjWKPGe8kXudLNqON9/Kb/Ng/TfQ
         kRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714172734; x=1714777534;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eR+2BKVfIQ6asNRHHcYrJ8Y7qY80A25xbM2Npp+gBUU=;
        b=axLnDiupyl+I+F1YMpq1e36ULuCFrmFcBmZUYZPCQgRJZJ40VmszznOY/7FNwsSAOK
         Wxrb/WnRO2X+IBM/saW4DQkg1mXlgv8MYQdhoQr2RhTEmZXdI2YPlo7F8k27iAy4ed2h
         /IuFK9ksfu2DTxFziNapSV6Gy93JmNvyRSY2paTa5uV2LratfeSgWW78Z2896IG4E8Og
         wsBVwwlOYyhDI5/uGAylCb2GlimG3PPOQtwE5lAnF3N290Mm74H+EHqVZpK+s6uenPLK
         CJe3LUCOsBE9iBIf7YG6sW9rWe7s94RXUhQ8jhQ3tOCCEThWOZ8trFt9ChPiemoxApRF
         BZPg==
X-Gm-Message-State: AOJu0YwCc+GbLhMO72ftKBt6PwXSd9FVet3YVbDFOS+0ZoAEQj8P1ZHk
	pEzoNm8RNuRvq8PAj7OgHCzSRuP+mN5JS43x5KJUXQaA13/qaKS+7CWii0tzxVtj/oM3f6RC0St
	Bq1eBqmNa58J93FuQdUfYUsY1nRHv5/uq
X-Google-Smtp-Source: AGHT+IFckNWQW0UcpQryX4EOMni4mu61U7lnArav4hxbUhpB4wS+Zdllxrt9jxtV8aRI5zPDoLBBEfUqd3bxiNN3egs=
X-Received: by 2002:a05:690c:6e0b:b0:618:8b8a:b4de with SMTP id
 jb11-20020a05690c6e0b00b006188b8ab4demr4940269ywb.27.1714172734177; Fri, 26
 Apr 2024 16:05:34 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Apr 2024 16:05:23 -0700
Message-ID: <CANx9H-CA+5VbUfPkqTSi_PygfXdGxOG577HQwaod=c=M_ismqw@mail.gmail.com>
Subject: libegl1-mesa not available in Ubuntu 24.04
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e787b1061707f07d"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Apr 2024 23:05:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5175

--000000000000e787b1061707f07d
Content-Type: text/plain; charset="UTF-8"

In the docs, we currently tell users to install libegl1-mesa:
https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian

But this is no longer available on Ubuntu 24.04 (there is a
libegl1-mesa-dev package).

I came across this while trying to create the
crops/yocto-dockerfiles:ubuntu-24.04 containers.

https://github.com/crops/yocto-dockerfiles/pull/103
https://github.com/crops/yocto-dockerfiles/actions/runs/8853986259/job/24316025556#step:3:128

I'm not sure what the original need was for libegl1-mesa. It has been in
the docs since before the Sphinx refactor.

--000000000000e787b1061707f07d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the docs, we currently tell users to install libegl1-me=
sa:<div><a href=3D"https://docs.yoctoproject.org/ref-manual/system-requirem=
ents.html#ubuntu-and-debian">https://docs.yoctoproject.org/ref-manual/syste=
m-requirements.html#ubuntu-and-debian</a><br></div><div><br></div><div>But =
this is no longer available on Ubuntu 24.04 (there is a libegl1-mesa-dev pa=
ckage).</div><div><br></div><div>I came across this while trying to create =
the crops/yocto-dockerfiles:ubuntu-24.04 containers.</div><div><br></div><d=
iv><a href=3D"https://github.com/crops/yocto-dockerfiles/pull/103">https://=
github.com/crops/yocto-dockerfiles/pull/103</a><br></div><div><a href=3D"ht=
tps://github.com/crops/yocto-dockerfiles/actions/runs/8853986259/job/243160=
25556#step:3:128">https://github.com/crops/yocto-dockerfiles/actions/runs/8=
853986259/job/24316025556#step:3:128</a><br></div><div><br></div><div>I&#39=
;m not sure what the original need was for libegl1-mesa. It has been in the=
 docs since before the Sphinx refactor.</div></div>

--000000000000e787b1061707f07d--

