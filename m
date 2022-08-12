Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28006C00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 22:12:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3190.1660342334035977199
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 15:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQkSrphg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id z17so2501555wrq.4
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Aug 2022 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=QJ8m35YnsyQPSCUr1d/GRfDazfp6NizCbdGH34BZbU0=;
        b=CQkSrphgphN+hhvsCM0NOy8lO6yhWcsv8EQB3S31vU7Rc4r+QR1UsBMgAXn9k9Z2IU
         8Xa6Y6ip9KvUpJcQPDpXMRTGxwKTEurKtAmeA09ii8IJF7iZDfbvg8+sw21iFd6MSY/t
         0gFNEO8MvR5tagl/4PmmG9wlTEOrgB5MNj+K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=QJ8m35YnsyQPSCUr1d/GRfDazfp6NizCbdGH34BZbU0=;
        b=z7pW0Qw7IH6WjyrEdUo9C8UJk3CmolcOITm0/XnuSPL1VUbQRmVN7IowajKqxgV87r
         HutQRx8KTovqTXRIpmyyQDdOCZk1Z19REjLWRR9P6i24xrlRlN/y1OTi8/ZD1PolaVBR
         xU5A8B9CN4ml/zTePFKv91YHzqiAlqHSCS0J59elr7r4K76H/64Ye5Ice2jS1hOIslyZ
         JUZoKt3TaWbWF/HOPoU8sNWkmtou4+GDNy5BwnwaRdQtQvbV4SzYqkeOdE4GKPllgpBl
         RRliZLSYer6gzI2fWn29AFOqDWJd4dkwMOzcZ5FgaR0Nw74UvFqJCOxf0+IRkiSqfm7+
         TpcQ==
X-Gm-Message-State: ACgBeo29iNZThVcd6ypmOAo+6dP5rvV3/qCIW/uVMS3928A7Kppsw5ui
	URhd1V4I+utjlja1IxW5rg45Iw==
X-Google-Smtp-Source: 
 AA6agR66tyrWLBvo+slTlIU3Mhdx/jK/5T77Rl7GijtmKE+sR/YepiGHIV4ssXUcHtKwBR6uvtf/Aw==
X-Received: by 2002:adf:fb86:0:b0:21e:3cc8:a917 with SMTP id
 a6-20020adffb86000000b0021e3cc8a917mr3224702wrr.538.1660342332237;
        Fri, 12 Aug 2022 15:12:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f?
 ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 x1-20020adfffc1000000b0021f131de6aesm488361wrs.34.2022.08.12.15.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 15:12:11 -0700 (PDT)
Message-ID: 
 <4f6cdbd9df67fc7dcc1eaaaeed12b7e89585d127.camel@linuxfoundation.org>
Subject: Re: [docs] [master] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 12 Aug 2022 23:12:10 +0100
In-Reply-To: <6d373d8d-6f24-8457-efb7-09c50c56958c@bootlin.com>
References: <17073A7A4D84FFDA.608@lists.yoctoproject.org>
	 <6d373d8d-6f24-8457-efb7-09c50c56958c@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Aug 2022 22:12:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3118

On Fri, 2022-08-12 at 18:55 +0200, Michael Opdenacker wrote:
> Gentle reminder for this pull request. It's still applicable as "master"=
=20
> and "master-next" haven't changed.

Merged, sorry about the delay.

Cheers,

Richard

