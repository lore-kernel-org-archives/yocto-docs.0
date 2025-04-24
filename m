Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8052C369D1
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:54:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.12256.1745492070192308424
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Apr 2025 03:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M0qhbLn1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so632500f8f.2
        for <docs@lists.yoctoproject.org>; Thu, 24 Apr 2025 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745492068; x=1746096868; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4F+28CY2wV6HPMRAvy8rDP2doIGIQ8BcSW5ctdoyi6M=;
        b=M0qhbLn1p7/LcCjEPkltq56x30J+JqOuWMhdV5ix2AWX0VZZv7Zy34z62IRFeo7eeU
         SzuW708M2kokfYD+p/YNkR4LWu/BCsuiFewWdesT3aC4CoKa/HGk4k/Kffz/aztkbfKM
         KzG+gafOQ14Z/povetQudyJxtIFwFS+UmVNHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492068; x=1746096868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4F+28CY2wV6HPMRAvy8rDP2doIGIQ8BcSW5ctdoyi6M=;
        b=DIVRYEgvrF4ACE73ZiGXr6XKLEbLFx8YyfomdkUDvDLpLbrNhNTN2wbndSx8G0wd/G
         LtjkNLr93POBC6A3S9v8Y+IFQKMcyDdqVKRhALCxF+qAMgi5/zmTEjxx8c2eVXAtP3IA
         +yk3R0HsbbcFlrt+4mklz/OcTzVgotu/IeuacJb9Z/rLjuRUF346UVT6+Jx4FCtsfNsU
         O0S06TNq1smpv97HM93o/vKD/44/bsG2Rn0W0yMdC/9hKvwPqKUnVmqTqNFX892JSoy/
         G65FdJcHhObnP37zZzN0lp9dg2+VXtfbWc1KXBe2N82SQzKK9Xv1AKCO99egdW55nflC
         aJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDHfZvCcl7yEZCTY7d7pUbkbX0Copt/GDqLgI9Ku273RHN+zPzH01Zaaz8jbWEA7mUZ+Ry@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyOq1BpFmA8VI5ujWv260YdcVPZNADkh7KmUhux+wHvrSftKvFK
	rxUEA0bWsze6BiyOhe6l4jP8rxk9S6UuVgII+n2fYC75i66Spv6pNb7R4bvxIQg=
X-Gm-Gg: ASbGncsLedIHgSnEbN6m12BWQs0+NewckU6kATkHOCayBPEY4h775/IsHsWrjdrKg59
	TUJ2j8SG4MBXFkQek8OAeqkvqhxbXTbYnvf1G4+AVQijrriWCtaJbaJoUy+8htfFQ8ai0/ejTb1
	tLy0GTPQWBbriiG4MGFXBdgERHyGjRsIMGqzkJ5cBbJP4sL2Yi0fXr2tPqdLUA2fEVmLM72T/Iv
	cs4vgbiteUcwW1c68Dtd0jcs926T/1MxqUk1EcCZqNvWhX2tFLM4JoAkQOYvrLqCjzLvzZ8vUt8
	V4224PKfIA0fWN8VmmqHtPsHqvV1tjfK9vyGLYhueCNNbzMnE2sIxWwBN5kt/pdLkdLCsxRVPh6
	Tf79Be/y50Uc7VSsmjxGUVJAIdhxKKw==
X-Google-Smtp-Source: AGHT+IHgVC0ar1AflyJGUogAsErnEqjX5SYKuIv/NZyoiH28Hx187Y2KpGVKOtbZL2tU/kF6ZYyyzw==
X-Received: by 2002:a05:6000:1787:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-3a06cf4b720mr1738962f8f.2.1745492068545;
        Thu, 24 Apr 2025 03:54:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d532976sm1703118f8f.73.2025.04.24.03.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:54:27 -0700 (PDT)
Message-ID: <3a847ee8e460bca5d98b56771669a2ef0f915af1.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH 0/4] Document library functions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, bitbake-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Thu, 24 Apr 2025 11:54:27 +0100
In-Reply-To: <20250418-library-functions-v1-0-3bbb836149d7@bootlin.com>
References: <20250418-library-functions-v1-0-3bbb836149d7@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Apr 2025 10:54:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6781

On Fri, 2025-04-18 at 17:15 +0200, Antonin Godard via lists.openembedded.or=
g wrote:
> Use the Sphinx autodoc extensions to document the functions from lib/.
> For now logging utilities and bb.utils functions are automatically
> documented. Some syntax a formatting needed to be done for the doc to
> render properly.

This is neat, thanks! We've wondered about something like this for a long t=
ime.

Cheers,

Richard

