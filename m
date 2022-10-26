Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35CCFA373E
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:32:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.9809.1666801954388668679
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 09:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iH9u16PN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso2023149wmb.5
        for <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+wv9mcoljMNuXtKevJtXz6LoABDhu2knHWKwQODz6MM=;
        b=iH9u16PNCoin6SFSQ3mAFv/tLawd5zY4UMw2jUNYmqAFHHGvZ+i+tUhZNmCE0HPbZx
         dR2kasqNdScgYUCzcVhNv30QK41LdpLAQqMH5Z+3fFjbBRPh8npeHqcqQyveVVi9ZlmQ
         /jCWmRmC5hHwuRtwGSJe1wx200IXflrTQHn1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wv9mcoljMNuXtKevJtXz6LoABDhu2knHWKwQODz6MM=;
        b=e1ScHfqJgBqALgr9goHGw0mb+J5dyB7t9yCgtd0fibl8M6OFBD0Ycg+xtr9HHrvjxr
         Rjx1FQ/JZ3HRYmBn2YW98mhho762KbXU3jGN3U8TTuIQLU8U4O4ncIKMG9qUBe8LIfnC
         X7vUq7ctMdt/E1VLabJI0nwjriCktIN1iwrT2t4UviDEjxxAscZCyUbNbYYERQnT2DCy
         5E2GQrpYsWaM4aHaIgGQA6MB1jqGFbKIyIsxWEb/4mbTEQuGsm8rxHOsE23/DyCHUO26
         qWfGj6jWfp2BBz8yV9K4478oIsBCOSJYzACU0WyA7cqoAxou1CqxAOMVdEVFBcwRTggy
         DqlQ==
X-Gm-Message-State: ACrzQf3t0yAW/j1bVfo89j3N92XSh9D7DiwpgTqRan3F4kNJA8AL251E
	G/rtDnXUqDKAnr7FKp9VSUiLOA==
X-Google-Smtp-Source: AMsMyM6oA2e1CZ1JE66FXBd8WAo1gR4NbKpi27MI4Lky9yzwDjYYVKnOIC+XbqWm6N4EgUS8MDC0eg==
X-Received: by 2002:a05:600c:548c:b0:3c6:d8dd:2a72 with SMTP id iv12-20020a05600c548c00b003c6d8dd2a72mr2997233wmb.179.1666801952750;
        Wed, 26 Oct 2022 09:32:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd65:7511:b73b:c094? ([2001:8b0:aba:5f3c:bd65:7511:b73b:c094])
        by smtp.gmail.com with ESMTPSA id ay29-20020a05600c1e1d00b003c3a1d8c8e6sm2322139wmb.19.2022.10.26.09.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 09:32:31 -0700 (PDT)
Message-ID: <8cacc3686a7c813bffa48e17c0bc5d98976ab41e.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH v2 1/4] ref-manual: variables.rst: add
 documentation for CVE_VERSION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
Cc: rybczynska@gmail.com, mikko.rapeli@linaro.org
Date: Wed, 26 Oct 2022 17:32:29 +0100
In-Reply-To: <20221026160713.2068570-2-michael.opdenacker@bootlin.com>
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
	 <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
	 <20221026160713.2068570-2-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 16:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3421

On Wed, 2022-10-26 at 18:07 +0200, Michael Opdenacker via
lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> From: Mikko Rapeli <mikko.rapeli@linaro.org>

I think your "From:" injection script may need a tweak to avoid two
entries!

Cheers,

Richard

