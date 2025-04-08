Return-Path: <algonell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B351C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:13:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.74289.1744118015409963638
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 06:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aNLl/RDO;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: algonell@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913b539aabso3258687f8f.2
        for <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 06:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744118014; x=1744722814; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdkAeb7UrBXqzOsJDngA1nAqNsUfPFw2sdKJVdTS/w4=;
        b=aNLl/RDOkelcgzB9QvSOPKdLWMHf36XgGF+HuX3PcFTSZd8HmCD0oNGBdqfE5QvrM6
         UIxmCoTsZ3QzheJEy5M/mxnNsM/jN28p9vyM12zgIpOHLtDT1ZKKpKqspGfP4EtGOgeE
         pVv8941Op7qZX/mHSBZZjgMorAZ1/+BTn7e1EFZkr188J/ww6gLenhDA7luoTzxv1Mgp
         l+uxcF5oJs2nRtOH74at3WS2MbCIR/yfrtcm6iwCDlaclJ8xMSzGekZP+ft19GxgSsF8
         3Xmacz2e0MLONB5x4tTJcQyDnlC44mPgh+pVwkEPxUIZLAnVcUkGqJpTj9nlZeHI3RhQ
         x7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118014; x=1744722814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdkAeb7UrBXqzOsJDngA1nAqNsUfPFw2sdKJVdTS/w4=;
        b=dTGzQXLeaPXZNERh1/LKcqWtEhaowxG5b+4p3QBuxc1rQqNLq/yhXksmSIzUrefipy
         lmL3ezbej52RuqRjx0uNZxOo4MVgZmECVK4gRcx6oW2o2xbCI6y9aMxHMS4sg0Y0e/dp
         SIkGM9Ug/TAbZiYfmk9akr+NjeQnAVxRgy3eupe+qfwYLVWFWMzi1+q76qUStxvMisKj
         8xIneAPY11NPSS08ANNNxr2J0wAnsYlM0Qc1N6cklZ1wa4hlku1ssNYbntc/MyqX5q2D
         Fj0DCc+AWLf+g457UlxSAjJJKNwWA/SgAydmsOD2SF8cKwNDXNVzkzNxBdLZo2yOiam0
         ooXA==
X-Gm-Message-State: AOJu0YxbZ6QmqD9yGQMANlwEx0XzyDzgUNTqMmcFJ8EM7DRQ9JnSAmFU
	KD+IlN/5ghpHbCUshoVpByknwTSZjR5IXm8Yoy6/OqTjPFW3/okdZ/NJXw==
X-Gm-Gg: ASbGncv4buOc0N1bWeMwdY9T2JiJf+eI5KVsOs5P4A2HtVABU61GfFkpN8XLIMweWIV
	BO7B5CNQG/4KbLh58DgfOculJ5/JNivqccn4hLEvTX7fgqE6gP1Y32kbr/5f0FOK4a4llXEyD80
	sEjtGqm2aFVq2aEf634UCKqAQJhS7FEdy6gLuMylCowa77LoieXIegcq6TIy6LWRfHkzVhcViss
	Gdzj3UWa2R111uzPMbtZ+zzsOSVCoyvIkw2d6n0GJbIc1E82lzsNSGTb9Q/6xs6AiFdZjo009gc
	nptpai8lPNKKiCiCchTVEuHzEg+FHGLp8WBt7BCTIIsIBM1a
X-Google-Smtp-Source: AGHT+IHxZ+BSUaQUHtf1oGhw1SAVzuSPpirmvre3QX8nrm6gZHi31Bj5WMVm5koZAzngGNJwDFxrJw==
X-Received: by 2002:a05:6000:2906:b0:39c:142a:35f9 with SMTP id ffacd0b85a97d-39cb3575bfamr14590834f8f.10.1744118013601;
        Tue, 08 Apr 2025 06:13:33 -0700 (PDT)
Received: from void ([2a00:a041:e0d5:e200:b092:b876:fdf5:980c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226be7sm14652597f8f.89.2025.04.08.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:13:33 -0700 (PDT)
Date: Tue, 8 Apr 2025 16:13:30 +0300
From: Andrew Kreimer <algonell@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: remove repeated word
Message-ID: <Z_Ug-lDngOvQZGqB@void>
References: <20250408113128.12973-1-algonell@gmail.com>
 <ccd6c80e-e3e9-45b0-a842-4ce7a35d2f28@cherry.de>
 <Z_UfqRL_P-3UhQxI@void>
 <88758ca0-fdfe-4c0f-9b96-88a2678b28ed@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88758ca0-fdfe-4c0f-9b96-88a2678b28ed@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 13:13:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6720

On Tue, Apr 08, 2025 at 03:11:42PM +0200, Quentin Schulz wrote:
> That was sarcasm/a joke. It's evidently a typo but was trying to jokingly
> justify it while giving my Reviewed-by, acknowledging that you are right
> that it was a uselessly redundancy. Your patch is fine and welcome, sorry
> for the confusion!

Great, thank you.

