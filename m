Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1247.1616604245862293161
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 09:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SVedr9pL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v4so25126848wrp.13
        for <docs@lists.yoctoproject.org>; Wed, 24 Mar 2021 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rgUtfULBWx9+2lpPoEHDDuGzyRSOXRHfVEpCD2eVI8U=;
        b=SVedr9pLf3cXs2nH4A69e0Jx3ln5JJ/5K5HL08fUu1VXk+Zd+BDyfLBinCYdqr20Jm
         QRyP+lgcvxJm7Ci+G4UgTp0amzpxfioN/hNCFKAenbDkC4c7hxBZQiw4QdqQjle+PdlJ
         EsK/EhyE4bNuNx+xokTizTKmuHl4lGuwh7oWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rgUtfULBWx9+2lpPoEHDDuGzyRSOXRHfVEpCD2eVI8U=;
        b=RNl0wBwS+QyY6mJ29aS/Zr5FUMjYiWHxh5g7w511US6uVERCDVtq9DrmE+MQSUAFwD
         vBqNRcvY79+MXXCfFWUlMD2neACIf0X1F8EZHo+F4n2tNS3zb97quIYoto6pkHOBqX1+
         Tya4I2BCzK8UnHRi46DckVWeOjkyv15ocgBY8cdPwEhDKYeFFlrC8UW73t0iuQZqeWi7
         emMtds9pJt3unLsjWDU1eCNvfnIDPgv+lYXkFtky9GEB30kTauQhEKLJTlYGP5NZp5gT
         iL0VceFUzP/V6AA6f/FrZQr+UGxH3T0OGIKfGMshfJs8D/TGVXYJ/hjZMf33PLQ+BqjL
         o4hw==
X-Gm-Message-State: AOAM530c95RtjJLPw4egje63gbDp2bJ970Go5nL5w/N0Zt3gUUJ9bzOf
	mdzhr/kDo3xsrzcr2P3R7JHGQw==
X-Google-Smtp-Source: ABdhPJxMjbnhCuilTQNUU3i0llXF9Pch6w8nJuJkIvqd8BX4sjrV8tVa4JIgluyrD5VREEyI1gIyQw==
X-Received: by 2002:adf:ea47:: with SMTP id j7mr4329919wrn.377.1616604244117;
        Wed, 24 Mar 2021 09:44:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id t14sm3671981wru.64.2021.03.24.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:44:03 -0700 (PDT)
Message-ID: <fb8b836dd93fe5c3f0074a5a10b6e00ee0127a53.camel@linuxfoundation.org>
Subject: Re: [docs] HOSTTOOLS and HOSTTOOLS_NONFATAL and ASSUME_PROVIDED
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 24 Mar 2021 16:44:01 +0000
In-Reply-To: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca>
References: <f76e5093-205a-5e1f-6da2-4658dcf23bd@crashcourse.ca>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 12:06 -0400, Robert P. J. Day wrote:
>   following up (briefly?) on richard's last post, a question or two
> about HOSTTOOLS, whose ref manual entry reads:
> 
> "A space-separated list (filter) of tools on the build host that
> should be allowed to be called from within build tasks. Using this
> filter helps reduce the possibility of host contamination. If a tool
> specified in the value of HOSTTOOLS is not found on the build host,
> the OpenEmbedded build system produces an error and the build is not
> started."
> 
>   i would first suggest that that opening sentence is a bit wussy ...
> it's not so much that the listed tools "should be allowed to be
> called", it's more, "here are the individual tools that absolutely
> must exist on the host or you're not going anywhere."

It is both. It is actually really important to describe what these are
being used for as well as what it implies.

The important thing here is we explicitly list which tools from the build
host you can call from tasks. A side effect of that is you get an error
if they don't exist. So no, I disagree the opening sentence is incorrect,
you're just viewing this from a different perspective.


>  yes, i realize
> the end of that entry gets around to that, but that should be
> emphasized from the beginning. i might even throw in a link for the
> reader to here:
> 
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#required-packages-for-the-build-host
> 
>   also, the required presence of those tools on the host is totally
> independent of whatever ASSUME_PROVIDED is set to; the
> setup_hosttools_dir() routine in base.bbclass has no interest in the
> value of ASSUME_PROVIDED. so even if some of those tools had been
> built natively by the OE build, they would be ignored entirely.

No, they would not. If they are built natively, they would be injected
into PATH ahead of HOSTTOOLS and used.

>  and these required host tools are supported by symlinking from
> ${HOSTTOOLS_DIR}. so far, so good.
> 
>   as i read it, the difference with HOSTTOOLS_NONFATAL is that, if the
> tool *does* exist on the host, that's the one that will be called
> (again, via linking from ${HOSTTOOLS_DIR}). if it doesn't, then that
> tool had better have been built natively as part of the build,
> correct? seems obvious, but just checking.
> 
>   last part -- it only makes sense that if ASSUME_PROVIDED identifies
> a recipe that should not be built, then HOSTTOOLS had better identify
> whatever executables from that recipe that should be available on the
> host. in short, ASSUME_PROVIDED and HOSTTOOLS do need to make some
> effort to stay at least moderately in sync (as is being done now).

They're related and need to be in sync, yes.

Cheers,

Richard

