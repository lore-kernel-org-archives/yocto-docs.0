Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C68CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:12:09 +0000 (UTC)
Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9676.1790856722871020104
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 05:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gY3hC4Wj;
 spf=pass (domain: smile.fr, ip: 74.125.228.96, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6aeeccb7d59so900801a12.2
        for <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790856721; x=1791461521; darn=lists.yoctoproject.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DT5nNfQOfOrQ0GE8ZQpiwpOgSxK0jqntWf5sIzfUqE=;
        b=gY3hC4Wj7fF65Q/iyEgVgKdMMBv+bU3n7rgiK4wG9jpacFZQuPMAZKgzvxtTuDsEzH
         cSi7pFz8ToText+v+Kiq6FmJOXUMW7kqngnaOmaT6X5G/yr235dF31igKLiKosK0lCfg
         3Qwoomp+r8KSUbF62rt763y7AknJkkrm/BLHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856721; x=1791461521;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DT5nNfQOfOrQ0GE8ZQpiwpOgSxK0jqntWf5sIzfUqE=;
        b=JJ5YoKLakJ9AhEGiiP+xFfptfN4/6U6Zw7Osp4EKU8eiK+K+PeVOhiu2mQAxcY4UKg
         yj2DCcREI4bz/JIeeMCRqrNhS5i4jebgLucrWWP1byW3ElI2O6Sng+Ao4d8VG2ocmE+H
         v4MNoiuJmKtx7YZPfynNt23vybCJnGogoUbwKPQ8jqRmzWBjZpFsbA8lFVYRutlh45Zc
         fu3Pjg5AAIrjqQe+1u77Zsh/Le1m0P3b3zLE+utdN++v+/1mTwKSGM/StyqBRJgQOtvy
         FvYWkdFmyPAG4X+vDIYZtOSDUrDihjnUNlFyGJA//hTLiLEVzPhjsMxXoBo/EiUOF24N
         GM4w==
X-Forwarded-Encrypted: i=1; AKwUvBwDgjy1jd7qQHOGR8Q50ODIjdeBkFJWYINnvmAd+LlXI002PH5cg6kEOJQXOEcgf1fB1cc4@lists.yoctoproject.org
X-Gm-Message-State: AFuF++nwfmR00B+CZKAaTaOVrva6OomBOCIkpnwKuZsApYFaz8IYUGeR
	bp3vsyLoDITkXvqS3rjyVCiXEa3kr4nK6FcnIcQxTgZ/bo4i2Sr4n0QjIoT6aHBuaUqruG7LPhz
	5leJy3pI=
X-Gm-Gg: AYBFou0roiCoQd4Iq6Mmp6dGidvJmJU0Z2Af0Z2ds6QHrbxBYPZC0WmBIDqLxg3b4+z
	QtihMGG9W2Aohz4oomyoiuVP8UtOJjKlsuUeX/nyAeX/mfUmuJo+RwRGXM0Sk6fGfTRUCGLTvoQ
	rRCjv7waVEn55XXNv3c8lBxGjoG/2DskAaCkF/PbE7ouG7sVzMJQ2VIllNxF2WuKNK5IdoXoQdX
	sZfPEgMtt8mvk0ha7Rh1/Hp9nhXgwt1+D7ACzdB7Dx7u0IyillmBDFevChMZpTlHzodzZtW1J0B
	nQtUY1pSqc7NIKsmHOxVXMUGd5w85aA9lOaQYROrXPSaiOHna5UwNsF0dUjzMiJlguHMcX95bjP
	Pew8r2jPXym0mwvHxGeXPs0NuT5Y19/SgLM2zWb/xpWXH3FhUxvsdd6AQa+FGTN8wxIf6Rg4D/y
	AO0GVOVxBdy65xLHbnoY/AojLSkRIZqWQzR57GbASr73Zxvnm3WGaL8ZDu22qJNyKjsDTNJow5G
	beVLOpYsr6xP3LRG0cmKQeVmFUq+DMC1diMGRkseYqUfSlyWngsW9lrQjLO3BU=
X-Received: by 2002:a17:906:478c:b0:c26:19e3:e97f with SMTP id a640c23a62f3a-c2e23d94f26mr375654266b.31.1790856720918;
        Thu, 01 Oct 2026 05:12:00 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dc70a2sm146746666b.64.2026.10.01.05.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:12:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 14:11:59 +0200
Message-Id: <DLTHQ3IQ5BGF.3NA4QUGWKD6KE@smile.fr>
Subject: Re: [docs] where to explain difference between .wks and wks.in
 file?
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <ca707b47-08aa-4cd4-97aa-070f0d515008@crashcourse.ca>
In-Reply-To: <ca707b47-08aa-4cd4-97aa-070f0d515008@crashcourse.ca>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 01 Oct 2026 12:12:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10646

On Thu Oct 1, 2026 at 2:02 PM CEST, Robert P. J. Day via lists.yoctoproject=
.org wrote:
>
>   it seems there should be at least a paragraph or two explaining the
> difference between .wks and .wks.in files, but should that go here?
>
> https://docs.yoctoproject.org/dev-manual/wic.html
>
> or here?
>
> https://docs.yoctoproject.org/ref-manual/kickstart.html
>
> rday

Hello,

FYI, I reported this recently:
16432 =E2=80=93 In wic class, the ".wks.in" template feature is not documen=
ted
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16432

Regards,
--=20
Yoann Congal
Smile ECS


