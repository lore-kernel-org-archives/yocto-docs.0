Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web08.9263.1603893569759307921
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 06:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FQLlWbI3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id d3so4879816wma.4
        for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2020 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9pFR0CdJY865XSVwc0xEZ+cYEiSMRVX4cs5eV+7Xfsg=;
        b=FQLlWbI3OvZznF/ctmcoW/fYLleowywg8e3x7RL+koDaRMqP9/SNB0sASXNs+KUhM4
         D5rqWd3fW0sgFQhjDEhSeWKriFIbWR7tUecBWhTdSVv9GrroQL9zbxp0wafK8nLANwzs
         zGG8ZRUgXXcsMfcnkaYCsDXUch3XD2NwG9k0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9pFR0CdJY865XSVwc0xEZ+cYEiSMRVX4cs5eV+7Xfsg=;
        b=rktHr0rRjvUM335DSClOC/ihv/TJuUOCTFevz9bxh3GGOauksc3temTZOkVU7Y7B9Y
         FxlokS0Cr5kO0S77Zbu0vsNJWkgNSMTB2qENA6IHzG6U6+Y1XclYU56d9jPQAMul4i+S
         kQ1i2KsyM/KP2zLwtvlg4tGXizbzwoWNaM8UFHCsONOdtRdON0MDZD2U+eQ5UafuqQTW
         EE2Cz5zC9TOVSzO8TpAXYIbzwURUEFHTuNudVoJ68p+uLYa2wBLt4At9Fw0EuLklwaM0
         9oF480HNMCOWRHnLTPvh2c7zMjW+dH0SY4wRJeqsg/N9a+ecCA1wCNi3g9XhP739JX1f
         TrTQ==
X-Gm-Message-State: AOAM533ZnhgX692EmCMnbBfP3MnH+zSa5x8tVJOxnY3nO0PTBKpiFoK3
	R6CRZrJhgYS9AqLZKa/UaO7o0A==
X-Google-Smtp-Source: ABdhPJzVOTHQ8wfcbUkRPxLQZNT3bxpQUfxCw6XLgAKxwX11zOcoujmTYVWrSpW9wDhDeaqD6T/CVQ==
X-Received: by 2002:a05:600c:4147:: with SMTP id h7mr7993686wmm.45.1603893568066;
        Wed, 28 Oct 2020 06:59:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id m4sm7492904wrr.47.2020.10.28.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 06:59:27 -0700 (PDT)
Message-ID: <3c80bf010492c17eac262f0a6c69b1227484fe7b.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual/ref: Add entry for why binaries are changed in images
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
Date: Wed, 28 Oct 2020 13:59:27 +0000
In-Reply-To: <D2630D40-E5E6-43CB-AEDA-C39318D2D349@0leil.net>
References: <20201028112952.172577-1-richard.purdie@linuxfoundation.org>
	 <D2630D40-E5E6-43CB-AEDA-C39318D2D349@0leil.net>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-28 at 14:15 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On October 28, 2020 12:29:52 PM GMT+01:00, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > documentation/ref-manual/faq.rst | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/faq.rst
> > b/documentation/ref-manual/faq.rst
> > index 7a1614028..b79ba0306 100644
> > --- a/documentation/ref-manual/faq.rst
> > +++ b/documentation/ref-manual/faq.rst
> > @@ -451,3 +451,14 @@ variant. For another example, permissions
> > errors
> > might be caused by a
> > Makefile that ignores ``DESTDIR`` or uses a different name for that
> > environment variable. Check the the build system to see if these
> > kinds
> > of issues exist.
> > +
> > +**Q:** I'm adding a binary in a recipe but its different in the
> > image,
> > what is
> 
> s/its/it's/

Thanks, will fix.
> 
> > +changing it?
> > +
> > +**A:** The first most obvious change is the system stripping debug
> > symbols from
> > +it. Setting ``INHIBIT_PACKAGE_STRIP`` to stop debug symbols being
> > stripped and/or
> > +``INHIBIT_PACKAGE_DEBUG_SPLIT`` to stop debug symbols being split
> > into
> > a separate
> > +file will ensure the binary is unchanged. The other less obvious
> > thing
> > that can
> > +happen is prelinking of the image. This is set by default in
> > local.conf via
> > +``USER_CLASSES`` which can contain 'image-prelink'. If you remove
> > that, the
> > +image will not be prelinked meaning the binaries would be
> > unchanged.
> > -- 
> > 2.25.1
> 
> I'd use refs to the listed variables to make it easier for people to
> find exactly what to do with them, e.g.
> :term:`INHIBIT_PACKAGE_STRIP`.

See the second patch I sent! :)

Cheers,

Richard

