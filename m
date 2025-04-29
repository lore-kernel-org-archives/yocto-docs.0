Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BBEC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:10:08 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.20904.1745935798689617208
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 07:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SmPZLxpF;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549b116321aso7327968e87.3
        for <docs@lists.yoctoproject.org>; Tue, 29 Apr 2025 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745935797; x=1746540597; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rn7f/ICrQ63FQxQ5lE43fQOloV4dgwHDy9ZCVGipy/4=;
        b=SmPZLxpFT8+MNApWuo6xAK4tWCtwoyIbmFS0EijtU+Z+eplxRvbAHjKOy6ov+gdmfL
         LZvLNfudfJgUWSIcm9JYUJfUgLHCupITrcKAqmYNhgmzhHrZnEHNRBxV524s2kQdIS5R
         yT09G7NSWBARxpKhMoy5XW8x1OeyQUprKodXEUEZUmJem23vIQknWmRHAH3CWkA3Xlqu
         bmJ+DcKLKQlXGFITxFtFeTzwozuHpYS9tMNOhkpbflqeswWtUBqcXMEjIVDY1lQYGWi9
         RLEINfkao1tdXe2+mCnqJby4WRSaQHBIXN/KD77kCxhaF1eDxXYHJ2HSz7AOJ+oaCnzq
         64aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935797; x=1746540597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rn7f/ICrQ63FQxQ5lE43fQOloV4dgwHDy9ZCVGipy/4=;
        b=j9pOUDXiHBpvv97PPS8sNCPPPn0azXuDKH07yoI9nVNj5tK24Y+ue149hvhIy2tbP1
         XDbYdaAkbl6o4cgVOi1eJl5LvJPZn2gfcD5ysDI7vesbXEIBF+sDlNBEA0Oe/rmJvGyk
         5t+LQfQuCXsFessF48RGg+UJSMQb8MxwNboeTvmBO2MGIAzX+3/YMXm5dqErDcIIRLpW
         DIAk3lZ6iWUcLR0lfvCnAnaQok9DwLBRIQrymWVZg3MMY7K0wj9WKYLtsYoeGo9hj2IO
         wfOYIFJQmJV5D3bfUWNzl506vRA19dpqh2oChJ7/rWzWTnK+gDo683LNvh+UAXNNRIdc
         o+rA==
X-Gm-Message-State: AOJu0Yx/qhmJ8NWf+XwVymQ8q3OFiXhcTHtJGeJ+97DjEQvmyWPyGLc4
	fEi3E9RlyEdYdDCsN0yYR0tKT0YADXUGNh9LV5L4ZTZjxDHu6x9tCrCTk05jClg=
X-Gm-Gg: ASbGncu4rjRiCRIak2NUjpx/3njZIYgZRsSaBrKwl4KkNx6xi/PvztIhzt18XwgfaY3
	fPznjcYJWIriFa5GGQCrlmJoa+oguxLa4MuRHAMbCLxgqaaWKgwfHk0PWnImeCeTMvw27X9bEfo
	qYdr9icGTLLlmyiajgbtKt1/QOtxm0f0JyJdCBV1FWXN0V7+m/zPLLAsp3zZHYF/yQAkvkfOuKV
	sjLsFds0qIXdMiBwKll2Og/9m1AOssZdUihoPxSHVtbJy2QrrldJIrufnuQZWgk7x3ngguFuePA
	uUONct/RFGKOvXwvz0cOi3yWSw/54Jlz0mJiMp8oAMxnRGNW7bD1LLdmhCmtO9iOlbC42SnhaA=
	=
X-Google-Smtp-Source: AGHT+IG2buGL78PvU+Op9kaF8Y5aSB0QQkUtDBRblhQAmcX/+sGlFiNspynRI0PsGK9DKgiII7iLsA==
X-Received: by 2002:a05:6512:2387:b0:54b:117c:8ef3 with SMTP id 2adb3069b0e04-54e90012c8emr3639478e87.54.1745935796789;
        Tue, 29 Apr 2025 07:09:56 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8c9dsm1884575e87.168.2025.04.29.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:09:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:09:54 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: gavrosc@yahoo.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
Message-ID: <aBDdsv0R-PWd_MIZ@nuoska>
References: <aBBxHNAS4Jj1G0C_@nuoska>
 <5570.1745932688799782566@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5570.1745932688799782566@lists.yoctoproject.org>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Apr 2025 14:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6789

Hi,

On Tue, Apr 29, 2025 at 06:15:08AM -0700, Christos Gavros via Lists.Yoctoproject.Org wrote:
> hi Mikko
> 
> thank you for the comment.
> 
> I thought this is covered from this sentence " Thus, ``INITRAMFS_MAXSIZE`` is compared with the result of the above calculations and is independent of the final image type. "
> but apparently it didnt! What do you wish to add more?

I don't object to your change or even want to change it.

I just think the overall situation with initrd size limit may not be
well described in documentation. It's more than just INITRAMFS_MAXSIZE
which is now well documented with your change. Thanks!

Cheers,

-Mikko

