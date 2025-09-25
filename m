Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0B3CAC5BA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 18:00:54 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.3787.1758823252098861052
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 11:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaD8da6R;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso2259041a12.1
        for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 11:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758823250; x=1759428050; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2lC/iOMLfqI/lKOMeKdOaHYTT9QeZy+98qJ+7YBRAc=;
        b=BaD8da6RhGsg3lkLdHL7Qj19CxQs+93bjerunpSc49U3u0QBycAALRXHetOtFUmkgb
         OVsTmdm9JiVCs81X9GsClR2Vq7+t9DdIyyxx4SnmMl3vh9Ua3acRdhRGM6XnFmiB+z+2
         zBauDpLEL6jJj9RFIbq/0qNSGTkx5ONWkVpgCTkScR4QdwWjTIWvoUWENqh28PNWtRYc
         vAdiq7vMVOAKleB6pK+EVqKltucJpLPI+pFB77ZjQEbg5C6PwjngXXQLsm2fG0HY7jq2
         dw1wycYDRDxK8MN/qteacUUlCUpPDCIwtBxXSfaYjVddKfUIeEO5+O/wlus+XmkZ/6Db
         zgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758823250; x=1759428050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2lC/iOMLfqI/lKOMeKdOaHYTT9QeZy+98qJ+7YBRAc=;
        b=KvLOYq4cN7GrDQnrYqM8pQjvWOCxrTfNZ+bPe4R7ekoyloQacJ2mHbkLDMMrgDENze
         lSzBZyDtNQzONr9XNmhQIFAcUG4avXi92n9ZDvDhSHBi6HTrG1rjsy55WNByJndC3P0v
         dgjkBo3yc8c1/z6g6ICTKzxYX9AK+AggxC7OR2u6XR1m/pQ8pbD1M/FI/bF+K5gmGGEo
         CHv89+vO9i6UpnEA7/6ATgaSOibkZv4+05Qk52liHLawBV/21GQJEDs9mnss8c5IQGgt
         VgHikK/R4eH1zD4+cZNT5NwvyQ4On4Y3/Uy54aHm2EdSKFU+AKCvZnoN/aGjvPRqT5Tn
         2MWw==
X-Forwarded-Encrypted: i=1; AJvYcCXMnI7HNkooQMgXknn8riXTHke+kWyNfZtG4/xYRGsw34vJDvRo3Vx7X3rYfpaq2jhnmI4j@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz3MvF7k1wNgw90A/lGhGQa1fLfF2xbeVDJXxF2+CzA7ztauAbn
	VZp74xM5gFC1vqZFxMOyp+tiGYvBPdwr7/s+i7M2fcLW29wX9LLax3dN
X-Gm-Gg: ASbGncsU2MuNG2S95FVjlKFBeyGSeDwMUKFNhFQLfeVz00nvqxFKbCXNqinxiSx0RSK
	cs6JxY9FSVQtaaLpv/Jm6AWozWfttvw+JJU0iY/Qg18v5y9pi6CxEac/y3GL7ZoStuihPr0dS6P
	m2I6y/UG9JRnHd7OsoseaeS6WflNNzDSNTuBKXWMO6uJYBiQxvWEaXb68BD4IdH6IsZ+KwHkXsJ
	JhDoTgwThhE8ocZdbSiwX4YWbaTINPh6lWU30qI0xP1VvE3aplJRHp+/sG/YdtEydgvavqXV053
	DmqA1Ou51IC+l8I/Vuga5k/wbmO8JfdzXReXOmo9Q6XBignn0wv8mNO/4Wldr2GuNQcxRLI/nYS
	FqJ+P6c261lbIw9lvumbQJXzRZIMPXK0=
X-Google-Smtp-Source: AGHT+IFEkrNqujES9TWBV3r83ijMlcEN7/sALJBg68v6yPIlbc5De8/axOL4ZsrGswMv5uAhTmhqfw==
X-Received: by 2002:a05:6402:5210:b0:634:a546:de45 with SMTP id 4fb4d7f45d1cf-634a546e2c6mr2830746a12.23.1758823249989;
        Thu, 25 Sep 2025 11:00:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3650969sm1541057a12.19.2025.09.25.11.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 11:00:49 -0700 (PDT)
Message-ID: <d81a1245-ad48-49e2-ad01-111102059a54@gmail.com>
Date: Thu, 25 Sep 2025 20:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs][PATCH 2/2] ref-manual/classes.rst: add diagram for classes
 used by base.bbclass
To: antonin.godard@bootlin.com, bhstalel@gmail.com,
 docs@lists.yoctoproject.org
References: <20250921164306.53501-1-bhstalel@gmail.com>
 <20250921164306.53501-3-bhstalel@gmail.com>
 <DD1YBMXM5MUJ.2N2XDSIL5KN6P@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DD1YBMXM5MUJ.2N2XDSIL5KN6P@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 18:00:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7604

On 9/25/25 16:29, Antonin Godard via lists.yoctoproject.org wrote:
> On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via lists.yoctoproject.org wrote:
> Hmm... if we really can't open that with Inkscape that's a problem from
> maintenance :/ I tried opening it with inkscape and indeed, I can't edit the
> text and so on. Maybe there's an option in draw.io for exporting for other
> editors? Otherwise sadly we can't merge this, as we wouldn't be able to
> maintain it easily.
>
>
As a test, when exporting as svg from draw.io, try to uncheck all the
"Embed foo" checkboxes - that usually produces a more SVG-like SVG
(instead of embedding raster-graphics and similar shenanigans)

