Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.99876.1597878000196379456
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 16:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XCiUmEey;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r15so268745wrp.13
        for <docs@lists.yoctoproject.org>; Wed, 19 Aug 2020 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8A6dFj/olqjzntK5SF4gWAdXc4JaARk74HOxiHs357c=;
        b=XCiUmEeyrK2rCFoOpKiI6h2TPu60ZkHU2D2iN6BSaPv4szTcW6b0Z/hNl0guG+XlLy
         eBghkZXeImW5j0LYQ5t1P31R1sdj4bYrGpYlWeqqbiubHvOKTVFrPxSgqro1Ox/qi/qT
         d4jNXm9et/8poc+X0KtbCw9lfIX+y+8Zy2OYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8A6dFj/olqjzntK5SF4gWAdXc4JaARk74HOxiHs357c=;
        b=sKUcmzwErvCoG37G/wHdekct61fGqAVd2C0QwKumhLjAG3zXJicLjnOxj1GsVXcZj+
         uJodd0W9YEq3wcrDzUY5i/JIXc4jhCYAkZqMmai409K0t8IYybgCFK8zf1iJ5s88dxcx
         p4RMPkh8tVFfa2q00u9dJlCptVUu/s/aPC2RP5+14ZYDEORR2U+2cqP8PBCiHjjNwveO
         0KnnoAN5AP4Ss+MBOv0IkcCgtEZO9ZN0q5dez/WKmiAJIvU7wMif35JmP95YxwDm817k
         /t9mi+1pP7av+Q7SOp6s6uNKZTt2xUfhzA55i0ADzkcxPq7DE/FZDG5vMJ5GAGEC+0ep
         OaMg==
X-Gm-Message-State: AOAM533XYX3NYYNktlWIMFnQcaZJqcqggre6/7ha5OBTqA0A2AaQTuUe
	dG+77pt6AHcPsM1H/qHX0KZ/Iw==
X-Google-Smtp-Source: ABdhPJwKfh/CvOQTOG/JDV15f9e2O19bjj7sJQXG5uX4663VSlv6C083W6YUUTfR18dGzlbtSd8xTg==
X-Received: by 2002:a5d:414d:: with SMTP id c13mr284150wrq.78.1597877998560;
        Wed, 19 Aug 2020 15:59:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id q19sm521819wrf.48.2020.08.19.15.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 15:59:58 -0700 (PDT)
Message-ID: <c05381ddd372bc0e82e6b24ce45df4ae2df90e1a.camel@linuxfoundation.org>
Subject: Re: [docs] [sphinx] updates as of Aug 5th.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	docs@lists.yoctoproject.org
Date: Wed, 19 Aug 2020 23:59:55 +0100
In-Reply-To: <CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
References: 
	<CAP71Wjy23FvmvO9joR5epF2t0O5h_fJkG7KDEDaZDddkjN8xUw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Nico/All,

Thanks for putting that list together, its really useful.

On Wed, 2020-08-05 at 23:54 +0200, Nicolas Dechesne wrote:
> I will be away from the Interweb the next two weeks. So I wanted to
> share some updates about how the YP docs migration to Sphinx is
> doing.
>
> [...]
> 
> Richard is trying to add support to easily switch between YP version
> within the doc (e.g. like the Python doc), and we will host the 'old'
> documentation as well. e.g. when choosing the 'thud' version, we want
> to show a static page (not a Sphinx doc) that points to the thud html
> doc.

I hope you're having some good away time! I'm sending this while I have
the context in my head ready for when you get back. Its taken me a lot
more work than I thought but I think I have something ready to share in
this area now. I've published some sample output at:

https://www.rpsys.net/yocto-docs/

Basically this combines the existing docbooks docs into a structure
with the new sphinx generated manual such that you can select and
nagivate around and see the different versions/options.

I'd ultimately like to replace what we have at 
https://www.yoctoproject.org/docs/ with this. I appreciate there are
four links there we still need to add into the new docs page:

https://www.yoctoproject.org/docs/what-i-wish-id-known/ 
https://www.yoctoproject.org/docs/transitioning-to-a-custom-environment 
https://www.yoctoproject.org/software-overview/ 
https://wiki.yoctoproject.org/wiki/TipsAndTricks

but other than that I think its much more navigable and usable for
users. Features/changes include:

* Clearly showing which version you've viewing (yes, css needs work)
* Drop down selection of recent versions
* Drop down selection of the format you want 
  (individual web pages or all in one mega manual)
* Older documents with newer point releases show a warning in red at 
  the top
* Obsolete releases show a warning in red at the top
* All the releases are listed on the main page for search engine 
  visibility which should improve their indexing and avoid some of the 
  version issues we've had (I've gone back to sumo at present) and 
  make it clear to users how 'behind' a given version is

I know the sphinx transition isn't complete so the "dev" manual version
has all the issues still needing to be resolved with the transition.
The CSS also needs a little more work to help with the colours/layout.

I'm interested to hear what people think of this...

Code is in the yocto-docs repo on the sphinx-rp branch. "make -f
Makefile.sphinx" will generate the docs I've shared and the generated
output in _build/final is designed to overlay the existing docbook docs
and all fit together correctly.

Cheers,

Richard



