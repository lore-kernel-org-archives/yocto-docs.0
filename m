Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1226.1792595836015785795
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 08:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=USkzjx6N;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b8b456dbeso8727626d6.2
        for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595835; x=1793200635; darn=lists.yoctoproject.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILi1k1VCKDvOMgGYKw5qkbItHRk8owECxPsIo9vjWZI=;
        b=USkzjx6NZk7oxzHKbOyX5EAZFXQLyS3PQy5zTphkFJTB0XzLUBVf8f55wAe7rYCHEo
         NE1dgPgDHeKtxhfKL5VLEOztDiOV1srfnXUy6Epph8Oy19M8BkLKGCdu5IqRXNkdwkGP
         t5YJMnyfOlsK/NrSbjn0hFXE+5TcOn3iKWz0lmJ2zojv4lJXihezcc4DrlcNInaNRACR
         HzyOn+5IfNlc7WXh3zYEackymXlKXK/olzbE10zjRZJqDJgOM+FtRzya/Kt3tt3tQSEc
         f6/WDxvZMnmbkRsdNhmZXdyVKkmued7B4tU7mhXLfn3UHf/k6GrHwjERmQLQLDLBw71P
         SYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595835; x=1793200635;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILi1k1VCKDvOMgGYKw5qkbItHRk8owECxPsIo9vjWZI=;
        b=KzsNP6n+hmGgw8qnACcHjy4vkXhr/pMIPqkk88QVBMMqnXyBoAmBKv/oKg0PG+KPMQ
         4D9UA8sLHCtFIsLrmJIk9QTiSmiOhB2oMjhNEeIFFgWqzOZLFQzh2W8cjdLmJo5BzvyG
         c8KlVqqoOgzkNUCrDp6gEhvPQQIxHx2xf6dowarzyBCpMFHnXuChGAfgJbucRnRcPqKb
         LM82ffXSVxb7zVwSg8vTgWAIQWRsPHRP6iRDdo0x3jLBLXRhYBOmblPgWzDigfmVtdD3
         QjzzU27w+4v4A+zVG22tV1qX0TOwB4rPazYRrbC+NrQq7UtdfqwUoPmkSm6xPXFStE0U
         4jKA==
X-Forwarded-Encrypted: i=1; AKwUvBzdNhJ/7Zgzcczg6xLYy3kmJ6zVf133Z5G617YAfQ+xVub/62ySzV6pQ+dNLX1IW3AGdf/o@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYKidWP/K3iemJt6B/UEcgPbO+jYrwmDax6GOkMxBTTReymeCLL0
	Fh0532rWKkpTMzJ02eFd6fhTZ0ONDAjU/6vb2uIMv0TGNK9lk4oVCccM
X-Gm-Gg: AYBFou2UW9U86OGCLuADgWZbjM5EkH29GRkukgIwoDiKF4v+qAmnpnAxvuafZwtoA+o
	Yq0YKdMs6bJTQ+6naKzqFsId3UKYx7mw8vkoENFPqDztaHKLV7cUVA31qw9d+QufGvOnSIQs4VO
	4/yiQxo+iErQD6480rPhMSnJkC24Dh8THXVCvn118bI6/Cu8l1oFEB8SzX4C6/vh+OjtSODwNrT
	qOyGPZEjvEUew9S3NRnQiH6Ps7Rw9Q7P+KrWkCyKnv4+XZV8znG9AyyvsuLDGlHM7CkTfp05Ncq
	4p4+FZeyLMGAqYds6ZXPKjLMnRFUN54ME7Ir11LNHmKrOn5zzwaqXgg9v7+mmHc77qhpGuiE3/P
	KbUi1TIvnYd/uMfcYE8xe1KofNxcKscoR7oY9aIHZ+UaWeAy7lQ5uuIWmJuDdOkkf11LXbO+T6e
	UOLqkQdjf6wAWA++/nh5JHU1QF1ibz2OZQx/aHtNKVAO2Ebn+UlSgxOpraB3QPa/NfofHKyLwHY
	jGSRXo/N/mKRFyIoldPTaMcJgbUKtkXCf9449rTGrS1b9QD0nbl4cpP3H5QtiAHx75wYVpbnQdl
	GXha5qHrkQiZMxFJmGHhr6NUDauNqclKZSwi2RFkxLU=
X-Received: by 2002:a05:6214:4689:b0:91b:b0ca:9f8 with SMTP id 6a1803df08f44-91c12efed2amr41472796d6.26.1792595834597;
        Wed, 21 Oct 2026 08:17:14 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b72cfdsm27061656d6.12.2026.10.21.08.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:13 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:17:11 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, docs@lists.yoctoproject.org
Subject: carrying lexers in documentation/sphinx: the ones after the shim
Message-ID: <atjXdzebFGmKVjj8@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 21 Oct 2026 15:17:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10710

Hi Antonin,

This work started as a desire to tag and highlight BitBake code-blocks
in our own documentation. Along the way it evolved into a task to
correctly label (and highlight) all code-blocks throughout the Yocto
Project documentation. In order to perform this work, two prerequisites
had to be met: every code-block had to be valid for whichever language
was appropriate, and the necessary lexers had to be added. Thank you for 
taking the first; now let's move on to the next.

A while back, you asked me to send the BitBake shim as its own patch. I
will. I am proposing a set of additional lexer patches, and wanted to
discuss them before sending.

One definition first, since the following table uses it. A "placeholder"
is a value the reader is expected to replace with one of their own,
written in angle brackets. E.g.:

   SRCREV_<nameX> = "<revision SHA for nameX>"

That line is not valid BitBake - the charset rejects "<" in a name - so
the block cannot honestly be tagged "bitbake". Rather than teach the 
BitBake lexer to accept "<" in names everywhere, including in the blocks
that are real metadata, "-placeholder" names a dialect: never a language
on its own, always a parent plus placeholders. It extends the parent
rather than restating it, and a code-block opts in only if it needs it. 

  lexer                     lines  derived from
  ------------------------  -----  ---------------------------
  bitbake (the shim)          442  BitBake's compiled regexes
  bitbake-placeholder         147  the above, one rule relaxed
  console (corrected)          53  a rule the manuals already keep
  console-placeholder,
    text-placeholder          140  a filter over the parent's tokens
  scc                         117  yocto-kernel-tools
  wks                          67  wic's ksparser.py
  pydevshell                   48  devshell.bbclass's prompt

Upstream is not the home for these. Pygments' contributing guide expects
a language "to have a reasonably sized community around it" and suggests
a plugin otherwise; ".scc" and ".wks" are very small, Yocto-specific
formats nobody outside this project writes, so that is not a bar they
will ever clear.

The corrected console lexer changes a rendering we already have, so
it is worth flagging. Pygments lets the preamble before a prompt be
empty, so a line opening with "#" is read as a root prompt and the rest
lexed as a command. Checking the console blocks in the manuals, I find
every such line is a comment or program output and not one is a prompt.
Requiring the preamble is the whole diff; "$" and "%" are untouched.

Remaining items on my plate:

  - the shim, on its own, as you asked
  - the lexers (discussed above), one patch each
  - the labelling and the conf.py flip last

If it makes the discussion easier, I could build and send a sample of
the generated HTML docs after these changes, so you can see how the 
result will look instead of having to judge based on a description
alone.

Best regards,
        Trevor
