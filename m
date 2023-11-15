Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1795BC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 10:49:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.10433.1700045349644195797
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 02:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YGUVC1Sd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32fb1c35fe0so3845560f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 15 Nov 2023 02:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700045348; x=1700650148; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3Rk7WkKmGBYVXLBcimHmu0mQR+q4tsrhirgT7MGLS8=;
        b=YGUVC1Sdlm6hlqVxJyR9WNF9CyQ9l/aptnuu1Q7gJE2pIHpc/0RU02Y8u3P3bswqNB
         Tdy6XUmf0wTSsuTX3s1ORGI3U7EoPS7EqQfy8M76z3dDNPUHTYnYAfbx7Uyj8LLhAlRF
         /BnWkPMbmAixaWypJMDR5IxWrgl2vKiI53Az4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700045348; x=1700650148;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3Rk7WkKmGBYVXLBcimHmu0mQR+q4tsrhirgT7MGLS8=;
        b=jVSWb8CKGCkF5eLz7Y0/zS9XzjBUDar5a5X3nsF/iVkaYICGqrpFMXIujw551rdWKn
         y0kG2qcZPZzK80JzMNEhGFSC0F0N1EkdaRPvbRERS1taximgDeFfZw287V9E3N2PlLNO
         AOQStoQe3U6Jy21St0W+U3yGChjGSADuVbp3t03Hvgd+3BohUR6CvJY99xja6oz3dD13
         VFhRhRpfQbDsxVCef5MLbxqVROUe+jbzA0z06KcyoKV9lA+ExjX1QYpchI3ww8kUmtd8
         VtVXYmmml43iMxvWWRj5ZRYNbqgXnngUTzJaGPrJwQMruG12lEmJi6viTZLSvD2exG6o
         sMUQ==
X-Gm-Message-State: AOJu0YwTnXpYYa9QEbavwLuI1HILw8XObLNa6a3Ugu5GF3a8kch0vNVm
	wOtAWxmdaHeXmYa+K/9X9afaKNEpHGtAajJ/l7M=
X-Google-Smtp-Source: AGHT+IGeq1Xv3o/jTl5+AwellvHj7Ube6kg0E0nekkLWsiVMfOFvg2IPSugk8nYAf/l/TDT0kE6/lQ==
X-Received: by 2002:a5d:6c6f:0:b0:329:6dbc:e9a8 with SMTP id r15-20020a5d6c6f000000b003296dbce9a8mr11481769wrz.8.1700045347513;
        Wed, 15 Nov 2023 02:49:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c? ([2001:8b0:aba:5f3c:bbf9:c35a:2291:eb7c])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d544c000000b0031aef72a021sm10207418wrv.86.2023.11.15.02.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 02:49:07 -0800 (PST)
Message-ID: <7b160a7572f4ba0f3446975f8e14f1e01924d393.camel@linuxfoundation.org>
Subject: Re: [docs] where is "But that file is already provided" diagnostic
 explained?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 15 Nov 2023 10:49:06 +0000
In-Reply-To: <46cf229c-4a9c-833d-758-357b7d5cafc@crashcourse.ca>
References: <46cf229c-4a9c-833d-758-357b7d5cafc@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Nov 2023 10:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4633

On Wed, 2023-11-15 at 05:40 -0500, Robert P. J. Day wrote:
>   Asked on OE list, but a colleague has two recipes that are trying to
> install the same files and, while I suggested cleaning up the recipes,
> just to get things running, I recall(?) that there is an INSANE_SKIP
> setting that will override this, but I don't see it documented
> anywhere.
>=20
>   The error message contains the phrase, "But that file is already
> provided by package", yet I can't find a reference to that in the
> "insane" class doc page
> https://docs.yoctoproject.org/ref-manual/classes.html#ref-classes-insane
>=20
>   Thoughts?

I'm fairly sure that isn't an insane.bbclass check but perhaps from
staging.bbclass or sstate.bbclass.=C2=A0If that were true, it wouldn't be
INSANE_SKIP controlled.

I can't see the phrase you mention in the code though. I kind of doubt
we'd have something that says "But" with that capitalisation so are you
100% sure that is what the message says?

It is a bit hard to offer help when we don't have the actual error and
you're making guesses about the cause which might not be correct.

Cheers,

Richard



