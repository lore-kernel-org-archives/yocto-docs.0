Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.289.1619818974572885401
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 14:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W3wZhxc9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f15-20020a05600c4e8fb029013f5599b8a9so2404191wmq.1
        for <docs@lists.yoctoproject.org>; Fri, 30 Apr 2021 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sHBWsjk7s1olmZD/2BKxXT/iZn5e4el/4PBf/G69+Xc=;
        b=W3wZhxc9qBx6Tlg6vHcj0Ud0fOIdLy4s4POf36eYtKhBiuac2KHFIO5ZaxRko6o42L
         IAmJlX0OXpTgKlrd9IScdNpe0ks2ZPiXKYvKX8iIj1ozgY76PylOnKBmskodrXvCrn+M
         9mWhnEcOa1fg6ODlfDfTdJm7rZ0N5+Pb0qR9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sHBWsjk7s1olmZD/2BKxXT/iZn5e4el/4PBf/G69+Xc=;
        b=CUw3B0IVgaOvxHIM6rvk+BNhIo1zvO4TMjZDSWe0SzCGukjHmQhU+jde0/aq+WfEu2
         c8ZjNvCABfus8JEcJ57ujI2EDcFHQAmy8zfkst0vx7mxgLr9xgmonFdqpQ4nUl16wMoE
         5nU5jxxw+yRu8MXK/GE/Bf0Gm6MRyOmXVDlazr+l6bq8zE5C8mhXN1RX2itMWBL9ntmO
         Cjl9tbsvTkKWTFVylDXPRLy1SQfWEqUrIUUBRxbsP21r8mjgIH7IQlTr99vDpEi0MrOF
         si66cbU6bdbeALItP6mSVkmPPY3hPSqi+ds+L3v6AwyBuYjuN3zJarm6wwwVh1o0xxMn
         nO6g==
X-Gm-Message-State: AOAM533e/z+utuOFMMEQNK2CZ1bGPTt3AeAFv/uTSuT4OXLxUtvUlGbm
	eu67yym8AfhjDqvbfxc+FygqUg==
X-Google-Smtp-Source: ABdhPJyYhihLxow5e738Q8HcvE+9V+LShNx8E7FHjSlh5BDwLGD6IrsDr+yy7fxPZ14tnm825Iipow==
X-Received: by 2002:a1c:731a:: with SMTP id d26mr19160872wmb.36.1619818972803;
        Fri, 30 Apr 2021 14:42:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:eb8b:7645:cc71:2e2a? ([2001:8b0:aba:5f3c:eb8b:7645:cc71:2e2a])
        by smtp.gmail.com with ESMTPSA id d5sm3830540wrv.43.2021.04.30.14.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:42:52 -0700 (PDT)
Message-ID: <a02682289c58c279707592fe71945addd62823ed.camel@linuxfoundation.org>
Subject: Re: [docs] [master] Pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org, Michael
	Opdenacker <michael.opdenacker@bootlin.com>
Date: Fri, 30 Apr 2021 22:42:50 +0100
In-Reply-To: <549040A0-1FB5-4E28-A812-4073A66E6948@0leil.net>
References: <c85f57b7-42a4-9d2e-09a8-e97ab7de6ab1@bootlin.com>
	 <549040A0-1FB5-4E28-A812-4073A66E6948@0leil.net>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-30 at 20:56 +0000, Quentin Schulz wrote:
> Hi Michael,
> 
> On April 30, 2021 5:58:59 PM UTC, Michael Opdenacker <michael.opdenacker@bootlin.com> wrote:
> > Hi Richard,
> > 
> > The following changes since commit cefd66301a40f9048499879674e467543f704c44:
> > 
> >   ref-manual/variables.rst: Add incompatibility warning for
> > SERIAL_CONSOLES_CHECK (2021-04-23 17:26:15 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.yoctoproject.org/yocto-docs master-next
> >   http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next
> > 
> > for you to fetch changes up to a0fc2e1b4bdc8411b97d02d34bfecfc888b6eb0c:
> > 
> >   sdk-manual: fix broken formatting of sample command (2021-04-30
> > 19:46:12 +0200)
> > 
> > ----------------------------------------------------------------
> > Alexander Kanavin (1):
> >       dev-manual/common-tasks.rst: correct the documentation for debuginfod
> > 
> > Michael Opdenacker (1):
> >       dev-manual: update references to Docker installation instructions
> > 
> > Richard Purdie (1):
> >       test-manual: WIP
> > 
> 
> Not sure this one's ready for master yet :)

Definitely not. I was trying to get some basic text pulled together on a couple of 
topics but keep getting distracted. I should probably put that somewhere else locally
and stop it leaking out. It was meant to be done and sent long before now...

Cheers,

Richard

