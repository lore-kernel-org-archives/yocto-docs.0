Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44193C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 13:56:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.6208.1655128593870343943
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 06:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JrKCIEOY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id c21so7277946wrb.1
        for <docs@lists.yoctoproject.org>;
 Mon, 13 Jun 2022 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=sRwc1ySwdBSub7U4QrW7huww5VErIuYXTIUVGnUGb2E=;
        b=JrKCIEOYz/hlslk34Axc/PdmlRA+1IzOpR2AGxkooWy9ucVFQWTDk8bC1gB+b0GomL
         U2kadfDk1FgkkTN9vJpn+MHjlxLdJBddB7xjVryhuxM7C03yLZZVOKE5jezULQKuMEy9
         2Onb45nVB/liLIuvYTGergJrBFzHN6zM4G834=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=sRwc1ySwdBSub7U4QrW7huww5VErIuYXTIUVGnUGb2E=;
        b=mYYQkW79nqy8XnABSrYgjEz7kslyFl6MrP/7I61nHmRtPJEu3NsAevdAAMGcUsztcB
         hOzWnGZMCNQ1+Z9yxhdooCSrSyYhUU6Cb96C0EEQGY1EO0WHtaeZ/mO1ZQo3wyh9CfPt
         CMeGDCvs+VMk+wb7euu3KspFokG71KuoYd3k0ek/kufzn8iuUszc4cdjAH8u0xjzQ4ur
         N7b814aDWT+kbsp5bF4xbcO2Q0hiP5pmo13b62xeUGXJvu8FRbTON1y6MVlv3ZnHbk9H
         pNsyJUOiuacd0GsQmVIakhPiDuVyEO6/1lM/5ZIFwX9iQWc5Hy4AKSNbBA+O7pHb75oh
         6+/w==
X-Gm-Message-State: AJIora9zWqNDnz/IjS4fzN2OolMioKFmxp1pArtwGYkLIVE9zkCkRmUI
	tC+TXWdlVxCZ5S2+5S2Ghpe14g==
X-Google-Smtp-Source: 
 AGRyM1uPVWAvhHVnfyfeKd8tNG4jqC503ljC/1+T/Kh0hkrj2V3Q8D9EWpCm9ND1Md/0u1BP8DULqA==
X-Received: by 2002:a05:6000:85:b0:213:b57a:ea74 with SMTP id
 m5-20020a056000008500b00213b57aea74mr3189wrx.69.1655128591964;
        Mon, 13 Jun 2022 06:56:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4edb:baaa:8bb1:f083?
 ([2001:8b0:aba:5f3c:4edb:baaa:8bb1:f083])
        by smtp.gmail.com with ESMTPSA id
 l12-20020a5d674c000000b002185d79dc7fsm8640247wrw.75.2022.06.13.06.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:56:31 -0700 (PDT)
Message-ID: 
 <38c002186fe2157ba4cd5a9372e97057c9ac1164.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref/dev-manual: Update multiconfig documentation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	docs@lists.yoctoproject.org
Date: Mon, 13 Jun 2022 14:56:30 +0100
In-Reply-To: <d67b1d84-86e5-c784-5965-9fce2c7e1666@bootlin.com>
References: <20220609094044.41131-1-richard.purdie@linuxfoundation.org>
	 <d67b1d84-86e5-c784-5965-9fce2c7e1666@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jun 2022 13:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2988

On Fri, 2022-06-10 at 19:42 +0200, Michael Opdenacker wrote:
> Hi Richard,
>=20
> Thanks a lot for the update!
>=20
> On 6/9/22 11:40, Richard Purdie wrote:
> > +   The configuration definitions are implmentation dependency but ofte=
n
>=20
> Did you mean "are implementation dependent"?
> I'll be happy to fix this by myself.

Correct, thanks!

Cheers,

Richard

