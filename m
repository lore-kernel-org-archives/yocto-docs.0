Return-Path: <algonell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5478FC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:08:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.74159.1744117679627444229
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 06:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OyYuXDJB;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: algonell@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso36834375e9.2
        for <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744117678; x=1744722478; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gEw/tIeME3eBwENlgh9h/sYBR7ScDCQ8jvca8bGeU8E=;
        b=OyYuXDJBQ989LYhrwJBrAmvBImZvoFQg4h68C/9jZW3XnMNACb4SbZ5huHC98C9OHl
         M1/jdsl4r/znbzeyC2MfQWzhwqqID0Ck7f2GB8pfDirKkx6ZM/zNIjuhxNfQbfJ8VtPX
         zlptz8ueIIPfpI9XJ9VFRx4sJpE8khY+qW6hL75Ya5mSM8gpsyWwas8iQhIUvqr2Z2bF
         LTRXUljX0xFLH341xzWWhBQ9v54nkUNTDo6Kf0w0F0vY5PgXfRqFsiFDhujX1b7Ea+Ht
         hNlLfzhAohAYunR0/LouJQvLdObAcZC3Gw2DWPBSpUxsUz1MhCAtO9XppBiPB8bdhNBe
         TUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117678; x=1744722478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEw/tIeME3eBwENlgh9h/sYBR7ScDCQ8jvca8bGeU8E=;
        b=tB1WRP+SNLg4N4pN2KuDyv3ydMgbmlOSomziaRs4o1QgRMAIRyCiOTUGpIbrStPL9z
         VcB3Eh34E1o9JMXPwu7MAgzPRRXwc4MasZMUaiq8KvUeTK13iu7uc3uhLytC0ZC0SFjf
         DzZGCWpsEthDduKTkx/rWGLEF4L9AwDOTd9DrFZpaBE0wF0lELJu5R9eSmzXcia09cMv
         Q3WlVgvXT787e/+qSe6gbOugVp0IVUzOKPKxeDcglHK8eBSmKKBsU8JoTXoSog32X7wp
         SbdrlDr3X76ClDI3cBCfNv3jidKsW5bcPU3pO/EDyxMQWDRptjhRwR6VYOaXJiJPjmo6
         TZvQ==
X-Gm-Message-State: AOJu0YzYLQlBKMfNUH59xFCM1wPVRMQqJta56S3uUjllXTZ7n0Y70DYt
	6rrCyrq9rHF9tSl5du9eJ/x4C96tIlj9+AVqMHXCSmUtqMZNpzDL
X-Gm-Gg: ASbGncvkFNZ3VlmZoa9C4ExS2u4NqhlvPAtOCW1TqUg6KS7TMA3WzyOYCGQ62CyL1l5
	C/4G1P05xzrZJnePECbK+26eKTQsPcz3wXZH/nADUbV7AyDVkBJ6RqRZtEBCYiPLqfWLbrdOT/+
	psi7wBNYfUvk52la3XkarU38Gd1u/5/c1uOMbzNaU79FQfknezLcyHgYzDUbBAlWI2Kp26RGKhB
	zxeCeF/ef5PYSXuqrqPlmGbErYW5Yl6DxQVg0ht2+ckStjDMXsMHmbU81053yyb6E4y7zt4/BCw
	vdzqeJpOEcTCKs6qhBZWsu7BWsFoz3LQgFg1iA==
X-Google-Smtp-Source: AGHT+IE2D8w+3jl9mDaCAhouqGTUDCsM2znjI4PqWmFD4gEkAA2+3T3ljNclprJ0Me42LCtbmco5JA==
X-Received: by 2002:a05:600c:cc8:b0:43c:e9d0:9ee5 with SMTP id 5b1f17b1804b1-43f189305d4mr8776765e9.18.1744117676254;
        Tue, 08 Apr 2025 06:07:56 -0700 (PDT)
Received: from void ([2a00:a041:e0d5:e200:b092:b876:fdf5:980c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f0e5e8dfasm26459895e9.27.2025.04.08.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:07:55 -0700 (PDT)
Date: Tue, 8 Apr 2025 16:07:53 +0300
From: Andrew Kreimer <algonell@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: remove repeated word
Message-ID: <Z_UfqRL_P-3UhQxI@void>
References: <20250408113128.12973-1-algonell@gmail.com>
 <ccd6c80e-e3e9-45b0-a842-4ce7a35d2f28@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccd6c80e-e3e9-45b0-a842-4ce7a35d2f28@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 13:08:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6718

On Tue, Apr 08, 2025 at 02:42:04PM +0200, Quentin Schulz wrote:
> It's because it's VERY modern, like modern among the modern ones.

Noted, thank you.

