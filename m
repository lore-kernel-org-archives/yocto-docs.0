Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2511EC6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 10:01:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.4613.1682157699529354389
 for <docs@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 03:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=VnfV0qcQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so2515433f8f.1
        for <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682157698; x=1684749698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n7phUwuPQcPcaZdbAiw03W53JRxQkgfB/I/Zja314wE=;
        b=VnfV0qcQqdfIUcfItcdm4rrhUFH7h2CAGtPyH+AyYA2gCvoPyy0M7K9CsoZGnGULu0
         9jBuj+266gKCnG+O2+4A+cjxbpd7vW6PS+XON/k7/1NCRzlDNclbOmXHDljhcYp4IrX7
         tOIXj1XC6NaxAkupu3rUn+sZT+c0lzCNFoPCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682157698; x=1684749698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7phUwuPQcPcaZdbAiw03W53JRxQkgfB/I/Zja314wE=;
        b=LqnlsTFgVT1vMq+pP1YtMTqKu1rO+wEHs/BUdJvUtl4dIVpUQT1T7C2KpKMm1hcnK1
         QlBsUoBqLWbx0VXZrUiZDWbFIjA5OJyq90naGMwE/p416KbZKmsZM0LDynX1oQKTokpi
         Sldp+SoTCaWC+CwpDFtChWlzMvjpYT75xFtmRKPRfJeB5R7ItDa/bqLHwq9A0UFkdVe1
         n1+HYd+FIZmv75eU8bLkcf0akd3eOXXuy17mfONrSGIpY5KTXS9w8CmzvoYgc/jQ8Lb7
         8xgK0fk1oeuBjeOl/9bVHYrqExQ7q+RprIBK/lleep8+0kju9z+wnUQ70r1DNN8Svn2i
         hbAA==
X-Gm-Message-State: AAQBX9c6ymH2u0Sc16DzoN/CtfnkzpZa/UcoqNuEDXoq4JyRmhablfCZ
	mHZieZ1csKXXrAbtX7dhdsJNUg==
X-Google-Smtp-Source: AKy350YGMs6ApiI+sakvdI2ibHbNXBsrMvv5DCtWY/SUXitxfWbnW0BaxTFTa3mZqHMBb1JqdiUabg==
X-Received: by 2002:a5d:6a08:0:b0:303:49f9:4a71 with SMTP id m8-20020a5d6a08000000b0030349f94a71mr3640116wru.7.1682157697813;
        Sat, 22 Apr 2023 03:01:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f22:3f4c:8346:a897? ([2001:8b0:aba:5f3c:5f22:3f4c:8346:a897])
        by smtp.gmail.com with ESMTPSA id g16-20020a5d5410000000b002fbc61cd080sm6302540wrv.9.2023.04.22.03.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 03:01:37 -0700 (PDT)
Message-ID: <f427391295df1ee31f77de7ffaa7cac103e66e72.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 00/17] Documentation updates for 4.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <bluelightning@bluelightning.org>, 
	docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Date: Sat, 22 Apr 2023 11:01:36 +0100
In-Reply-To: <cover.1682133339.git.bluelightning@bluelightning.org>
References: <cover.1682133339.git.bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 22 Apr 2023 10:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3869

On Sat, 2023-04-22 at 15:19 +1200, Paul Eggleton wrote:
> Release notes, migration guide and additional manual updates for the
> imminent 4.2 release.
>=20
> As usual I found a bunch of things that were undocumented that I either
> needed to link to or that I felt should be completed, those are included
> in this series. There is also a dependency on the BitBake User Manual
> changes I just sent.
>=20
> Please let me know if I missed or messed up anything :) Thanks.

Thanks Paul, you do have an eye for this and do a great job, it is very
much appreciated.

Things looked good from my perspective and improve things. We're about
to rebuild the release due to a kernel issue so I decided to pull these
into the rebuild. If there are any issues Michael spots when he is
back, we can improve as needed with further patches.

Cheers,

Richard





