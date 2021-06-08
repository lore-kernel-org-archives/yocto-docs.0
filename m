Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.11898.1623157810148888991
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 06:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WRHwKgpD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so1816004wmq.5
        for <docs@lists.yoctoproject.org>; Tue, 08 Jun 2021 06:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/g7Qqxnfofr/+lZN16RvrZls2KvSBUp8LuGcvzpeHZU=;
        b=WRHwKgpDxi2amSMYMle3/IrombGzsHfl69P7fSLChOkdhk9h7HkgoxAYsnr6UN4NUx
         MGaDNzQPjFJp0zaXBWmCXcN+7dDgoWemIZ4fSLL5eXM/NOjh1zPOxr+Tc5k0DOYfnU8b
         Hb3Q68sphQSuOnXcw1cqdITnheKvKRkQONUDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/g7Qqxnfofr/+lZN16RvrZls2KvSBUp8LuGcvzpeHZU=;
        b=HGxFQHKvHOF9f8BmHRAPGR8QnErfurE7+WpKZzo0oDrYrVGvlE+K50uPyzkrvyOBxv
         rjTByvF/bjhMFj06i98ZOYNTArKvGK764MdtatOgUDUoRhsXT4bQFly5HLFUcIrsMgd5
         D4qJaC7lJk5ezs9jbYdTX+okyqJFqHNwbU3gGWkADb9hvmAVSz/qNw1rV/+eZKHu+yb6
         /XJz/kHpkXQIOPv1nA069IZNZPFxzKFjknTWp+ZuuOyOF0mw/q2IZGz44utD3CljrbkT
         iOD8t0OYtjVbU90hUaqR2rmqSggkqhTZr+ejWE1J53y0J5IqZhg51fx6Courjv7oZUAD
         h2Vw==
X-Gm-Message-State: AOAM530cMM/TJvSGSB3MyZ54vZrCxYWCawcMGF2DUigNY3ku6G3HOg7W
	Opx+55M45PxGPQZBABpZ/RapdQ==
X-Google-Smtp-Source: ABdhPJzosTy7G3cuIyC1rC1MG89JnPKmpNuZ2KkNGiiFC9NDm2v4aDGQ2I0+ZwN/oURWWnjAxwsZUw==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr4231098wmd.187.1623157808471;
        Tue, 08 Jun 2021 06:10:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:119e:2d1:fea4:6669? ([2001:8b0:aba:5f3c:119e:2d1:fea4:6669])
        by smtp.gmail.com with ESMTPSA id k5sm21422477wrv.85.2021.06.08.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 06:10:08 -0700 (PDT)
Message-ID: <0591116ff6dcf30424f4a36ada7248898b7a1527.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] test-manual: add initial reproducible builds documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Tue, 08 Jun 2021 14:10:07 +0100
In-Reply-To: <54e468ef-829c-b821-b08e-881907c71f33@bootlin.com>
References: <16868CB8BF8EEF84.10003@lists.yoctoproject.org>
	 <20210608095853.48522-1-michael.opdenacker@bootlin.com>
	 <54e468ef-829c-b821-b08e-881907c71f33@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-06-08 at 12:01 +0200, Michael Opdenacker wrote:
> So, this was my pass (fixing typos and style, adding references, adding
> more punctuation, breaking long sentences), so that other people can
> offer their review now.

Looks good, thanks!

Cheers,

Richard

