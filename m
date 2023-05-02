Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B8DC77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:00:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.177.1683039622238757244
 for <docs@lists.yoctoproject.org>;
 Tue, 02 May 2023 08:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=RnMgNCav;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f3331f928cso23488165e9.2
        for <docs@lists.yoctoproject.org>; Tue, 02 May 2023 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683039621; x=1685631621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p50GYeG0oVhYM9QZ73yPKD+r80PLTv9QdBpOPS5/fAg=;
        b=RnMgNCavLnC1yVjePIeXh3hmdJMdRuHUC2kcthH7fmrCyr3TKdEc5l1DBNMeEmVcsw
         X1qi9zd+fBgrfWbqbwebionZOStHpti6TU0LX4OtoP7VU3xz0k96GOWh39oYVWVa3jwE
         yd2R3Hi7BthjDRFn8dvQTPZkOQ1i2Om8Jh7rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039621; x=1685631621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p50GYeG0oVhYM9QZ73yPKD+r80PLTv9QdBpOPS5/fAg=;
        b=RN1wLJ7GaTKMiDzP71DSJfcLkJ2qCNG9E5E4Ihk00PAu6waZkYbvehx0voHtiAJhMc
         YpRXFJ503KtN4T2iajoT2Y4qxXff0WrmXGoa2kHTSWCE9uP7B3gdjefBlWfpNkIfUsbC
         Ub4d/YbTr5EY+HlgTpDpijA2t03vVgvC/V3KI8LsFZELEsKI+64aHvhX/vjJ2WEyVmeP
         rJ7aC1yN3xgMzvpOrN+MQAGi39mUqPTTNy5kG/2wLZcGik726jGWz0cmTdl/g0jrhvUj
         29BXb2lodh6PISOJFlw7dS/TkRI6GGiCI0bTdav0lSe9YzCocPvf5y9GSV+cT7kthzi/
         XppQ==
X-Gm-Message-State: AC+VfDzORNDDFPtePwvdgZuLEIGtlUB9wZXVIir2+Mnh5LHsKs5OiAWs
	fG6J7r4QdXuBQkQ3b9nA4l2uJQ==
X-Google-Smtp-Source: ACHHUZ4sMebaEeYJTYSwE/3rnAzK/xsvl4ldsN87UT0qzqXAV2LihJFDcGb5jmsYDU4VsdUvfi4sDg==
X-Received: by 2002:a05:600c:cd:b0:3ef:f26b:a187 with SMTP id u13-20020a05600c00cd00b003eff26ba187mr12346448wmm.0.1683039620640;
        Tue, 02 May 2023 08:00:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cffc:b608:40fd:850d? ([2001:8b0:aba:5f3c:cffc:b608:40fd:850d])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c215300b003ee20b4b2dasm35852490wml.46.2023.05.02.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:00:20 -0700 (PDT)
Message-ID: <4a1d1ab1a80f0080dacce15dd8c70e99b1d3d6fe.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: don't mention the
 INIT_MANAGER "none" option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Date: Tue, 02 May 2023 16:00:19 +0100
In-Reply-To: <CANNYZj87j00m1AvQKKCDTZBx7soGETUvtV4GgKLpeKrhDnfPKQ@mail.gmail.com>
References: <20230502144906.2449915-1-michael.opdenacker@bootlin.com>
	 <CANNYZj87j00m1AvQKKCDTZBx7soGETUvtV4GgKLpeKrhDnfPKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 May 2023 15:00:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3892

On Tue, 2023-05-02 at 16:55 +0200, Alexander Kanavin wrote:
> I so t think having an undocumented option is a better choice than
> making it do what it says. We can fix nodistro to use something else
> for the fallback.

It does actually do what it says, it is just that people have
misinterpreted what "none" means.

"none" in this context means no value was set, which means to fall back
to the behaviour that we had before the INIT_MANAGER existed.

It doesn't mean "there is no init manager".

I agree it is ambiguous so perhaps we should rename it :/

Cheers,

Richard



