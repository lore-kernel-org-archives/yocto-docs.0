Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.10288.1623256066939125108
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 09:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GUfvIAn0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso4611877wms.1
        for <docs@lists.yoctoproject.org>; Wed, 09 Jun 2021 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+CctCchBJkzgKeGhWY3We53YbQ8bIDPHYfqKPQbn/iI=;
        b=GUfvIAn0aN+2c8OJv7K2A/RolMk4++pd99xCAdZ5ErIsXDRtlkQer9GqCLL1fls0cn
         sVpaqfR8VqFFs0s48zFR5wSkfCP5UBusYvAmS1WqukzM6xMqXT7h2lQlPCbbKk198cGx
         3wBhkgoiq2XADEFs9HE83XkyKwHHu0050/i9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+CctCchBJkzgKeGhWY3We53YbQ8bIDPHYfqKPQbn/iI=;
        b=CYd31uPG95JpQ+gCcQ+vLtRtIkK14q+bsRQedxmO8Fu5gPRfq1dUAvXB8T34OWCTYW
         IjjbPse0JEf7Vwh7erUvKI7Pu5uVO83FP2gZrCUNPoo9hiwcc7PEaWx0BpFan309YUyN
         62N4FeWQiOSt4j9Wc0qU+PTDJGYU/HyO5aDUBy54Z/ACJWDD0Tg40o4LbdvEQBa4iYUK
         K+5v2mxlvPFkAFumX1skymKE0JNzdnXIuGOCK6EdYBWaRW1OWb1FN3UpYiGOMKR7b/kX
         Bq0/sF7XVi6zbNsfyATId+C0NoNKEaOMwBv6cxyi8dTsdKedIp6lr0ycDZV7Oc3E3EXU
         aGfA==
X-Gm-Message-State: AOAM532L3OxADBDR89HDCqnMqIYlryQq32KX+VVqnrll1toV8BaO1vi9
	Ep/LOZkwpWo3qGS/YVFypmTSLw==
X-Google-Smtp-Source: ABdhPJxuzBsSgovtxxnOEkwQYAoLHgurmDTTeHeKDXyr+C0Toc82XAWkNRItNbt78OpFeJ1OSj+bPA==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr6613507wmh.101.1623256065412;
        Wed, 09 Jun 2021 09:27:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5ca2:6776:ae9b:a3b2? ([2001:8b0:aba:5f3c:5ca2:6776:ae9b:a3b2])
        by smtp.gmail.com with ESMTPSA id k36sm233695wms.30.2021.06.09.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 09:27:45 -0700 (PDT)
Message-ID: <0af619633b94c521152d40753d34d4354231cc58.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] test-manual: Add initial YP Compatible documentation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	docs@lists.yoctoproject.org
Date: Wed, 09 Jun 2021 17:27:42 +0100
In-Reply-To: <6d9dc010-a9ec-1f05-803c-f1f5ab662c17@bootlin.com>
References: <20210608090255.3089963-1-richard.purdie@linuxfoundation.org>
	 <6d9dc010-a9ec-1f05-803c-f1f5ab662c17@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-06-09 at 18:24 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 6/8/21 11:02 AM, Richard Purdie wrote:
> > +
> > +It is intended that over time, the tests will evolve as best known practices are identified and as new interoperability issues are identified which unnecessarily restrict layer interoperability. If anyone becomes aware of either issue, please do mention it to the project (in our tech calls, on the mailing list or to the TSC). The TSC is holds overall responsibility for the technical criteria used by the programme.
> 
> Would you have a link to contact the TSC, or at least a description of
> it? I couldn't find any, and that would be weird to suggest to contact
> the TSC without such a link.
> 

tsc@lists.yoctoproject.org

https://wiki.yoctoproject.org/wiki/TSC

Cheers,

Richard

