Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8A2FA1FD9
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 17:15:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88009.1776878140502803906
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 10:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YDE72P7f;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8ed4dd182efso196605185a.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776878139; x=1777482939; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6W2T5l5hmg4GA2qf4KFp7ySc4JjKhdqWTBqjdIcl4O8=;
        b=YDE72P7f1kWgR4/ZYBPqN1/b/FArgT0Uex7uGw6SmM2y8R3hdglLjvaICmJIeMZgKD
         yQFKvvmA4rU6CEw/txqVM0DRKV50yoBfhn25oT0PHewiuz09KCZFQwNd2nLhD5NhwV8m
         QYP4QcyQfa6wLI0/uggxWGa5YgZeEjTKKddBl7r0jG+JA4Hz+OOPIeYSnS4p7y/TeN/7
         M2oynp1nvHe/CesgwfU6xZl/Lal8hPezNNmWDLNKP9Wsy0AyVuHM2iP5JuGV0k44NoL1
         5WxjRa6MtxpxFCHFF60kV5SBqYmOmgpSba1xlbb9tmhajJsS7Lm5skze/BuRkKJ8ehBT
         0y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878139; x=1777482939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W2T5l5hmg4GA2qf4KFp7ySc4JjKhdqWTBqjdIcl4O8=;
        b=Y3hfZsZfdJC1Od/G5OFZhDl32HyUw9P6TstdRmXHrH9yYvt/TEr3nDiooELJwI/V0K
         rulFX2dZJNwxQWu7vSKnqMf/KJBZmeaU3lCekKi+q+5i8xhS0W6RbXY4a4rolbTfkdhD
         SCHpk58/yJ0lgbazHxB5Q+whIPcjfrmnYyFgILukksQfLnp1n1okVZFdpSnrr+CeuTWa
         x6QPT1TJDscLFRihfe7eBVUEZ5t8Hirs3TXBnHcAOHMD/T1kEY4kx7xKnINa2DJm/2Ys
         bWYRE8jDlrxNx9AZpe6KM+bRBLT9VgENdK/xRO2yLd0Z7Ku+Ag6hMHydo+mSpyEtN5YF
         oQRg==
X-Gm-Message-State: AOJu0Yy+7PA8VJGItQX3PPobeSsgsrfIEYxtcLNtHxzw9pQjfpRAVpt9
	QSzz0perKn6E42sa/k4PbKQfiuY9kTkPtHCw2XR5ItuA8kbZnJI3yGIo
X-Gm-Gg: AeBDieumYxcXMC3YFKk4nx3tRoN3K7xn2CCMhCBKUhfNe+jmfnV4mTCfCDf8Nl6GLxV
	RSwUaHNeA2YF8cUKuvW9FqsTS/ztAaweuImTIC1X4XMt8AhjgDGksVgRpanC5iEPyzc7wbA/ys0
	i4kzCIoCpzno6zB9PVtUmE0bdFdb/6pSbzRKDh550XsPLAAikNbgIfp6iG2u39FqRha67NgsQco
	F9n5aE0W4IYDcwejBosWNSswnFzVvydsywXy/8wInAopuGpqN+lOxoHppZMoOaTqKRlGiNcU5Av
	wRKMtjn6g06T4O9Z0z32uEfJo33Y1A+FW5l9WIw3ALxZLP29iTn3VikTJElVZitqJqUJugqoJJV
	7RUM8TsQi6Sq63/ejw9rlg5cVKPGRR5CNvcp1oxQbKulVhLFlPxbVXxuDYye/KYnGhBlDBbkTFH
	0AHBaiNTEmnTXHPp/a2mWUfs40mKJN6c7l3nvC5OHtUjcv5gCRMBzG4ewXIbiaWeu76tpQRMxgj
	8iO
X-Received: by 2002:a05:620a:29c3:b0:8cf:cfdf:733e with SMTP id af79cd13be357-8e7918a1473mr3156176885a.32.1776878127510;
        Wed, 22 Apr 2026 10:15:27 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d8edc2b9sm1464705085a.23.2026.04.22.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:15:26 -0700 (PDT)
Date: Wed, 22 Apr 2026 13:15:24 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Trevor Woerner <trevor.woerner@amd.com>
Subject: Re: [docs] [RFC PATCH 1/2] add a "bitbake" pygments lexer
Message-ID: <aekCLM6QTkN_VPqC@localhost.localdomain>
References: <20260421172416.1801567-1-twoerner@gmail.com>
 <20260421172416.1801567-2-twoerner@gmail.com>
 <DHZHJMU79QRA.QGWLX7MEM1TL@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHZHJMU79QRA.QGWLX7MEM1TL@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 17:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9327

On Wed 2026-04-22 @ 08:55:39 AM, Antonin Godard wrote:
> Hi,
> 
> On Tue Apr 21, 2026 at 7:24 PM CEST, Trevor Woerner via lists.yoctoproject.org wrote:
> [...]
> > +# Pygments does not ship a BitBake lexer, so this Sphinx extension provides
> > +# one.
> 
> Have you considered contributing this lexer to Pygments instead? I would rather
> have it there than having to maintain it here.

All development on Pygments occurs on github: https://github.com/pygments/pygments
Currently there are 143 open pull requests: https://github.com/pygments/pygments/pulls
(some going back to 2019)
However, the latest release was 3 weeks ago: https://github.com/pygments/pygments/releases

I will create a pull request for this feature and see where it goes. The
contributor information for the Pygments project is very clear that they
are not interested in adding/maintaining lexers for "pet" languages.

https://pygments.org/docs/contributing/

Of course *we* are all aware of how big the community is that uses
bitbake, but will we be able to convince them? bitbake's usage is large,
but compared to, say, something like c or python... All I can do is
submit and see. Realistically maintaining it ourselves is a likely
possibility if we're interested in this feature.

It was interesting to me to discover that our own documentation does not
know how to handle bitbake syntax.

