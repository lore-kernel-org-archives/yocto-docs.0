Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2975DCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 13:40:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.25542.1759239637475346739
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 06:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VNzuM0mN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so51190765e9.0
        for <docs@lists.yoctoproject.org>; Tue, 30 Sep 2025 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759239635; x=1759844435; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RSECzYKe8rIQe472OhMry5bXQ/UTnNSs0ycjeJxSn0o=;
        b=VNzuM0mNUr+lkhiC8ZEWzTnNR+U7b6mMyIxvdfGmNt1KWpNbTEYW/lrQCp/9Q68qj8
         WCgcP7eFe0HCxKhviltEl6FunpQ9iUXp2vTpq6C/Jel5vITl9pp3f9WwnUbsphl48JM6
         kVlY46yk7zVJNlpG5ULnpdqUHKqbqLWDF8Pmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759239635; x=1759844435;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSECzYKe8rIQe472OhMry5bXQ/UTnNSs0ycjeJxSn0o=;
        b=ky6biOGNhpFAkuF41A6aah8VQFEt/RQJ55w9eBeMI4J4lMGJWKGUbpJmEPQXW0wmZ4
         fb/nGIMGG/suevAehYbEViGTdpOZUGUdx4QnJuAHy+Ez5Z1ohwWh3mfcCKyc/fgb1P0M
         tVD8lcxqWndLA+Dqt5jZXTzknJ6hBzguqbfd5129Hth7MuMYTRN8hixWshen7TfIBUOQ
         0O90DULM6oOr9FNiLBOLvxj+90Fl4PyWumgH7ctFz5VgLrobOIKM65vPVsHhRXeW0WIB
         cR+VYlWKg6o1QxAuSMugwWBL1b6N481J1UC9LZuGqhQ+M6JrLfYMIQoKg7k78OCrzNDE
         k3hg==
X-Gm-Message-State: AOJu0Yzr4BSe40Ti2POWGpd6YrXiAPfIOzpDUYWOpNA4gooQLzhAPil7
	orDHlFWDCfhb1bUyUXL/y1dJ6OB6W7tsT278oDqzo/UgI7NtT3y08Zr3lexnONRahqdtWUFh7Lx
	y8n3I
X-Gm-Gg: ASbGnctOJpo3IU8lNbvQhZzym8FyV31GEJz6JTHmy1LVSmdXfyVmBhMG9L4kE7vGimb
	lhFU86CzEz6uV2RJwzCWnJrhJ/MSliUW8HjAf5jw2IDkQCi1uBY4mWcDV+D+EMYWNR5srCrCejM
	LZaGHfipU9tEpDgjT4Z7UZMLagXbpIyva9V2eXuSWo0WsDMstjgYW47nWLbmRYX9iTryIkTT4Ed
	pEDUYLOUD/CL6kJGVxwNafekrjSEMtvtqnByjQ1hgrJjBDh1Rvs1aoJzkoqY5lste+bAac2wY2H
	3bBHFy01Kuzkqu/7aj7zmrXZTrg008p/jps4pEI79whwn7q8Qr+8/vg849YjzJGurn1g8HbArgg
	yhn4unrf+zipBMAq8isvsBRK1p6ir5IHGWqOgsGwRVISzsVWtmB+WhSZ8ehpLUOE6ko4x5Bqcam
	5dCirhKfWn/m/Tm6Dxl1D5tCW7CzWJonIkupuk4936la0=
X-Google-Smtp-Source: AGHT+IG2Rdd1YCl8KWNzy9e6/qbQBZRDtbTUlanfcMhBcpKVPdmFfj7d8XcoSGokTLYxz66Prim+7w==
X-Received: by 2002:a05:600c:6296:b0:46e:2330:e959 with SMTP id 5b1f17b1804b1-46e32a2bd38mr197853585e9.37.1759239635220;
        Tue, 30 Sep 2025 06:40:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:55be:9f8:6c8b:6835? ([2001:8b0:aba:5f3c:55be:9f8:6c8b:6835])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e56ee6b19sm66624375e9.0.2025.09.30.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:40:34 -0700 (PDT)
Message-ID: <061e6150ce177221f7b6ee8754b03a20347a92c3.camel@linuxfoundation.org>
Subject: Notes for uninative.bbclass doc enhancement
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>, "antonin.godard"
	 <antonin.godard@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>
Date: Tue, 30 Sep 2025 14:40:33 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Sep 2025 13:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7630

I was asked some questions about uninative, I've tried to write
something to enhance the class documentation on it:

"""
Uninative allows binaries to run on systems with older or newer glibc
versions. This means native recipe sstate can be shared among different
distros of different versions, i.e. the sstate cache is 'universal'.

To allow this to work, we change the dynamic loader to our own ld.so
when binaries are compiled using the --dynamic-linker option. This
means when the binary is executed, it finds our own ld.so and that
loader has a modified search path which finds a newer glibc version.

We don't change the linking of the binaries at link time since the
headers on the system wouldn't match the newer glibc and this causes
obtuse failures. Changing the loader is effectively the same as if the
system had a glibc upgrade after the binary was compiled, so it is a
mechanism supported by upstream.

One caveat to this approach is that the uninative glibc binary must be
equal to or newer in version to the versions on all the systems  using
the common sstate cache. This is why we upgrade uninative regularly and
on our stable branches too.

Another potential issue is static linking. Static libraries created on
a system with a new glibc version may have symbols not present in older
versions, which would then fail during linking on older systems. This
is one reason we don't use static linking for our native binaries.
"""

I'm hoping this is useful info and simple to extend
https://docs.yoctoproject.org/ref-manual/classes.html#uninative with.

Cheers,

Richard

