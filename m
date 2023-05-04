Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCAC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 20:32:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.5724.1683232333925742107
 for <docs@lists.yoctoproject.org>;
 Thu, 04 May 2023 13:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=CxsQAH5o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f1950f569eso7272975e9.2
        for <docs@lists.yoctoproject.org>; Thu, 04 May 2023 13:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683232332; x=1685824332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FiDEoVt+TB49Kq5YZ0Xy7MOqCjpHA74rXEcTQ9llSoI=;
        b=CxsQAH5oVbcZBpnf7k13mj1rZAlKhKfML//OVHO6r8ThiSoAG9ecx69Bs0N/MfnphF
         UFULjqzsHEPUDarULps+fUxXhz+lAGIUSR3wvZeqi+coZlDoVaC/Q7+VTYYnhNM7WGto
         W1NO1NQGv5nbGDTSg4zTD/7B0+zy/9UC3wTMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683232332; x=1685824332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiDEoVt+TB49Kq5YZ0Xy7MOqCjpHA74rXEcTQ9llSoI=;
        b=BeamVANdrUkf7dWCUPa3pX9VfKEgsZBXs93jUZ+lsAremfwx+a/JO1LA2yBvidVADm
         ig54io6uEMMvKf6+j/VkVCj4M1w+skjE2ZKi1Vz4nE7BdIx/Ts9eXED0P189uAU02Ngm
         WY/fLfjiCRN+1koQQohZuhsgwBne5VFgpMxUSHyOjWZSRLvAo2HRk8C9702wiZ648ILB
         pHBklKfwRXWvOf/ozUdfd7hFjQvTxgQD/G244OSNhcFpgWOHa9qfU9xM495MueOdVFJv
         Wfy5e/fi3/TZpqWQL8HvAPdtpfRkAPDycFD/neSo5dbCfA82gKFscXoJFzyzf51HQOdn
         UxpQ==
X-Gm-Message-State: AC+VfDzgfCfHDOHF88y8Wf+kP4zl53pS4i/h0GBZtsJi7M2XLXmrbQHi
	d47ql1xORZjO8SOrSihbKr13Ig==
X-Google-Smtp-Source: ACHHUZ7foM+t3WZm4CidRq525m5ipUpIPixYA8EF9lR6Q44/ZJgHC+bvKCYzyaOfr4mpjovGESQ6kw==
X-Received: by 2002:a1c:791a:0:b0:3f1:6f44:ff3a with SMTP id l26-20020a1c791a000000b003f16f44ff3amr627786wme.13.1683232332306;
        Thu, 04 May 2023 13:32:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id n18-20020adfe792000000b002f7780eee10sm151356wrm.59.2023.05.04.13.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 13:32:11 -0700 (PDT)
Message-ID: <138930bb46ca53edbad2b186f630bc5688635aab.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] docs: add support for mickledore (4.2) release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <mhalstead@linuxfoundation.org>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Thu, 04 May 2023 21:32:10 +0100
In-Reply-To: <CADfgfoZ0VtaxPni_Uy1vptxqmmeX9zvvE6C2867v=bt=EnZi9A@mail.gmail.com>
References: <20230503223456.23985-1-mhalstead@linuxfoundation.org>
	 <fcd085b3-44de-9dfe-a063-381de52dae5b@bootlin.com>
	 <CADfgfoZ0VtaxPni_Uy1vptxqmmeX9zvvE6C2867v=bt=EnZi9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 May 2023 20:32:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3909

On Thu, 2023-05-04 at 12:47 -0700, Michael Halstead wrote:
> After this patch the docs are labeling both 4.2 and 4.2.999 as
> Mickledore. Is that=C2=A0correct or should 4.2.999=C2=A0use the
> devbranch=C2=A0name?=C2=A0

4.2.999 is confusing but correct as the code stands today, it means
"latest unreleased mickledore branch". We really need to do something
better.

> Also it marks 4.1.3 as=C2=A0obsolete=C2=A0already. Is that correct or is =
it
> supported until the end of May?=C2=A0

4.1 is supported until the end of May.

Cheers,

Richard

