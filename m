Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.16528.1586964072832844329
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 08:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=drd3gqh5;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id c63so17617341qke.2
        for <docs@lists.yoctoproject.org>; Wed, 15 Apr 2020 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a54+cw5hTP8u8+RrhRpa1BcSZ/lHbO7fq1eFyw5LZ3I=;
        b=drd3gqh5IJaCC64aZ7turVuynRVfJBpJOr24GpOQOtF9HvAm5uZVeszrpm7RcxaP9y
         PRTkawmTSQq7m3dx4DPD6qFm82ZuuYPVLwkxhJCQ6nELSABY6J+qWBHG00XR61vufqwj
         QexL4XGR5Ajn7ke4XhjAqVD5R7CgDoHbr2QFvSGA7kNhaQQPUlPT+gqGsKazgckVYAGN
         dgJczCcUPK4w9dy5w9VSrXbH+Wy7RjfsxiSezeS8tPRHDhZlMPAmntACAX2363L8BK0Z
         e0CoDidH4vA2uzgO4JPjNgFIXDgy6yZbDsfJhdJFbttS2A2J7aJNQtwwjk3hRNo9nAGG
         V9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a54+cw5hTP8u8+RrhRpa1BcSZ/lHbO7fq1eFyw5LZ3I=;
        b=cqobdIl96b4vdX0X+8NSsTFcPBIQVNorldcVd6lMx+Wu0/sUbhl23JO0pZQqLpYKWa
         oz1qeL1dFiW9pSaCG8c/pI5vmQpCaXZUNFnzfxk8qhYbnf/wCtEZGmn+NWrxVXR4Vfvf
         XH0y9/KyD292IOYErwZqQW6/HXQ5GPGC2sQB66eOXG9fJa09qQQmy1Q+BFVW626wqsAU
         i/DdfB2BZtbfHZri6olicc56ZT0OpB0U50wVPUZW0alSNSs7YUNoz1paPQ2qXFNoB6zR
         FAburG03AqFFYkCi2sxLA0X9Y/+vf0JEMPe3R95dCUEa+CnBjz/WqIKAQAOT4enaDrgN
         yUlg==
X-Gm-Message-State: AGi0PuZSUu/dXVhcEuGHBKIF76c6VYpl6546MTeBKe7T5MdLeGHtrUPk
	RsfvvXjfTHHPLhnLPcERz6uN5csW
X-Google-Smtp-Source: APiQypIUjUfPriLTeqq9YjbkYRkN3Z0tHQ04Z27SbFa/unJkL4ZVoKf1xytIuVtrVjiu4kcEi5nN1Q==
X-Received: by 2002:a05:620a:1401:: with SMTP id d1mr25314378qkj.333.1586964071613;
        Wed, 15 Apr 2020 08:21:11 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from linux-uys3 ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id 10sm7088272qtp.4.2020.04.15.08.21.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 08:21:10 -0700 (PDT)
Date: Wed, 15 Apr 2020 11:21:05 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] Possible changes to the project docs
Message-ID: <20200415152105.GA11838@linux-uys3>
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-04-15 @ 11:19:25 AM, Richard Purdie wrote:
> Basically, the thought is whether to move from docbook to sphinx.

This sounds like a good idea to me.

Prior to yesterday I had never looked into sphinx before. Skimming some
information about sphinx, it looks like it's flexible with regards to the
exact formatting you use for, for example, section headings. If that's true, I
believe we'll need a "coding standard" in place before proceeding. We wouldn't
want the BSP Manual to use:

	section 1
	^^^^^^^^^
	section 1.1
	===========
	section 1.1.1
	-------------

and the Reference Manual to use:

	section 1
	=========
	section 1.1
	***********
	section 1.1.1
	^^^^^^^^^^^^^

Best regards,
	Trevor
