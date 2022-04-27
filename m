Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC48C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 15:16:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.9727.1651072565346500151
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 08:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bsckdfr5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id k2so2971482wrd.5
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bo2dp6v0ZmHhcyw1pn0MevjscnyTF7CJw96aQp2ECTg=;
        b=Bsckdfr5S4PBHUzKiWgObUZ2fcKrs6jVgJL5MweXnEGCiHB623Q7sicrpablGdmwqU
         q5N5Ybxt76XIuXRLsE96tkbmxGrgm8jZPNtaJT+4Jn4tUD0NszOMA5tXIpyxbDndbpAz
         NrEiJWdkZjpLimjtAJDIxRguJWluwsNqXRXxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bo2dp6v0ZmHhcyw1pn0MevjscnyTF7CJw96aQp2ECTg=;
        b=54miTVEXUHZOZEzTMvwKMu8DEiF5joZeVV06mkxSVJZ5NFUbmn61hgTtA5AtoaK1hr
         2FhnppDh2DnrzOb6Q/0sdJo7iFuNqpyJktpJlmUAbnK2CaDCtT25zqK0I9IwnsGk+7Ic
         JNFowEBiZdF7DrfdKw05SakeNfbYD4ZpYSFp9z3nHpZT1NLtNRVCrNLjvqj/W3029g4J
         fmDOCKYBy4ujFCjrU2UmXO0CvgEQ11DIUq0PC2RSgueJp4uF+mpuKPoLZiMJK8msdVLC
         6wTN96IxbnET4iGzDltYKs7jIECIuM2HXV2VMAvjS0AOeN2WKeSUlvkk2a0eh1oeeBqj
         ENdQ==
X-Gm-Message-State: AOAM531umVtZgfvC5YkUJtLuqq7juhfuTN6zm8VJ08kUWpjbtzVLvSOj
	wlyBMnfJ3fQ6QHXBonwv8lffbQ==
X-Google-Smtp-Source: 
 ABdhPJwPR30Bn77BKgJImmUVEttA7IrLne0dpQKumbT8AgYSnfGibg0fxnx2+bCD0eQE/pmWQ38X1w==
X-Received: by 2002:a5d:638b:0:b0:20a:f2ea:f8ef with SMTP id
 p11-20020a5d638b000000b0020af2eaf8efmr1247740wru.186.1651072563695;
        Wed, 27 Apr 2022 08:16:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b0038ed3bb00c9sm1743288wmc.6.2022.04.27.08.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:16:03 -0700 (PDT)
Message-ID: 
 <ab884d90b13eaf3a7572b964607b549bbca7bccd.camel@linuxfoundation.org>
Subject: Re: [master] Pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Wed, 27 Apr 2022 16:16:00 +0100
In-Reply-To: <86dbe301-cb69-466c-8428-bb9edc5dd26b@bootlin.com>
References: <86dbe301-cb69-466c-8428-bb9edc5dd26b@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 15:16:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2896

On Wed, 2022-04-27 at 16:04 +0200, Michael Opdenacker wrote:
> Hi Richard
> 
> I'm submitting this pull request to include 2 fixes for the
> documentation after the release. Since Nico's fix changes the URL of the
> release notes in the documentation, I'd like to have this merged before
> further spreading the news.
> 
> I'll take care of the kirkstone branch separately.

Merged, thanks.

Richard


