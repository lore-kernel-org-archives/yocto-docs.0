Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9823.1623142978407022201
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FwIQ8Lw5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id l2so20718610wrw.6
        for <docs@lists.yoctoproject.org>; Tue, 08 Jun 2021 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+rB/WM4Zo2kMH4icxzn5bFn8zrpOHf8+rnXajn9mGIw=;
        b=FwIQ8Lw5gw3UG0LonDrevlU6kjRIgOtewvKyknk3oCHCMwdyDpKcWnHMwmWk4JU17m
         U6abhyO255erZLfqmTwJVb270etjNaYRdF1RmhEyr4F8OwErrgewJghxpRa2exeit6cC
         p+l7r0JmpSRGee10wmsoXdcQVgKuDYFGVCY9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+rB/WM4Zo2kMH4icxzn5bFn8zrpOHf8+rnXajn9mGIw=;
        b=R45STCVkA/Uc3jRrKpTu2XzEKEoPYjgJ20k9fokak8IeAY4GFRnHwH7GKmLbmZcl4v
         j4Z17s32EEFk1RiyU4cYZhL5mbRoqBkO3g3Qt2aSTOm03Lz8Pj+t2wuuI61Kvsl7e3ZK
         ilCvqWXtAB8JnwEyIIiiSzILRxWnBIFHbTmBdbmmZzDdT/pD4CYK03v4sX9u6pzA9ufQ
         XbWLZJ1JwZsczqoeoHj3mg6b8ubFhGsAr9NWy7QvvOmUBG2/C7fTW+JPWDIB6rreVC2J
         B5IFEcZAjHtw1eO4J06hdTylG8ZR5Os33mFkehWmHsE6BkQnX6sj/nKAG2ztX+asXhtH
         XxuQ==
X-Gm-Message-State: AOAM5313OA7paF2NQseFQM3gfWbpCTLjnOd7DP9aNJo6qwiInFlkO3bD
	hlEMBZrSsK8zW0APO1F0cHfW2ok5F1YLYA==
X-Google-Smtp-Source: ABdhPJwy3y1cFhmPOPLMUIizjT1cApQvLtkDTswLbLYZ5pI673t5i1RRFiDBZSKw2wMmqSR5WwnHLA==
X-Received: by 2002:a05:6000:2af:: with SMTP id l15mr5531694wry.213.1623142976540;
        Tue, 08 Jun 2021 02:02:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:119e:2d1:fea4:6669])
        by smtp.gmail.com with ESMTPSA id n8sm16586373wmi.16.2021.06.08.02.02.56
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 02:02:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] test-manual: Add initial YP Compatible documentation
Date: Tue,  8 Jun 2021 10:02:55 +0100
Message-Id: <20210608090255.3089963-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We need to document the Yocto Project Compatible badging programme. This
adds an initial piece of documentation about it from which we can improve
as needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/test-manual/index.rst           |  1 +
 .../test-manual/yocto-project-compatible.rst  | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 documentation/test-manual/yocto-project-compatible.rst

diff --git a/documentation/test-manual/index.rst b/documentation/test-manual/index.rst
index d122b5e27..4c590a6aa 100644
--- a/documentation/test-manual/index.rst
+++ b/documentation/test-manual/index.rst
@@ -14,6 +14,7 @@ Yocto Project Test Environment Manual
    test-process
    understand-autobuilder
    reproducible-builds
+   yocto-project-compatible
    history
 
 .. include:: /boilerplate.rst
diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
new file mode 100644
index 000000000..372b701bc
--- /dev/null
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+************************
+Yocto Project Compatible
+************************
+
+============
+Introduction
+============
+
+After the introduction of layers to OpenEmbedded, it quickly became clear that some layers were popular and worked well, others developed a reputation for being 'problematic'. Those were layers which didn't inter-operate well with other layers and tended to assume they controlled all the aspects of the end resulting output. This isn't usually intentional but because they're often developed by developers with a particular focus (e.g. a company's BSP) whilst the end users have a different focus (e.g. integrating that BSP into a product).
+
+As a result of noticing patterns like this and friction between layers, the project developed the "Yocto Project Compatible" badge programme where layers modelling the best known practises could be marked as being widely compatible with other layers. This takes the form of a set of yes/no binary answer questions where layers can declare if they have met the appropriate criteria. In the second version of the programme, a script was added to make validation easier and clearer, the script is called 'yocto-check-layer' and is available in OpenEmbedded-Core.
+
+========
+Benefits
+========
+
+The OpenEmbedded Layer model is powerful and flexible, it gives users the ultimate power to change pretty much any aspect of the system but as with most things, power comes with responsibility. The Yocto Project would like to see people able to mix and match BSPs with distro configs or software stacks and be able to merge these together such that the result inter-operates well together. Over time, the project has realised that there were things that work well in layers to allow them to operate together. There were also 'anti-patterns' which stopped layers working well together.
+
+The intent of the compatibility programme is simple, if the layer passes the compatibility tests, it is considered “well behaved” and should operate and cooperate well with other compatible layers.
+
+The benefits of compatibility apply from multiple different user and member perspectives. From a hardware perspective (a BSP layer), compatibility means the hardware can be used in many different products and use cases without impacting the software stacks being run with it. For a company developing a product, compatibility gives you a specification/standard you can require in a contract and then know it will have certain desired characteristics for interoperability. It also puts constraints on how invasive these code bases are into the rest of the system, meaning that multiple different separate hardware support layers can coexist (e.g. for multiple product lines from different manufacturers). This can also influence how easily those system components might be upgraded or maintained for security purposes by one or more parties during the lifecycle of a product through development and widespread use.
+
+==================
+Validating a layer
+==================
+
+The badges are available to members of the project or open source projects run on a non-commercial basis and are tried to the project member level as a member benefit but anyone can answer the questions and run the script.
+
+The project encourages all layer maintainers to consider the questions and the output from the script against their layer as there are often unintentional consequences of the way some layers are constructed and the questions and script are designed to highlight commonly known issues which can often easily be solved leading to easier and wider layer use.
+
+It is intended that over time, the tests will evolve as best known practices are identified and as new interoperability issues are identified which unnecessarily restrict layer interoperability. If anyone becomes aware of either issue, please do mention it to the project (in our tech calls, on the mailing list or to the TSC). The TSC is holds overall responsibility for the technical criteria used by the programme.
+
+Layers are divided into three types:
+
+* "BSP" or "hardware support" layers contain support for particular pieces of hardware. This would include kernel and boot loader configuration, any recipes needed for firmware/modules needed for the hardware. They would usually correspond to a MACHINE setting.
+
+* "distro" layers defined as layers providing configuration options and settings such as a choice of init system, compiler/optimisation options or configuration and choices of software components. This would usually correspond to a DSITRO setting.
+
+* "software" layers are usually recipes. A layer might target a particular graphical UI or software stack component.
+
+Key best practises the programme tries to encourage:
+
+* A layer should clearly show who maintains it, where change submissions and bug reports should be sent
+* Where multiple types of functionality are present, the layer be internally subdivided into layers to separate these components as users would likely want to use only one of them and separability is a key best practise.
+* Adding a layer to a build should not change that build without the user taking some additional step of configuration to active the layer (such as selecting a MACHINE, a DISTRO or a DISTRO_FEATURE)
+
+The project does test the compatibility status of the core project layers on the project autobuilder.
+
+The official form to submit compatibility requests with is at https://www.yoctoproject.org/ecosystem/branding/compatible-registration/. Successful applicants can display the appropraiate badge which would be provided to them on success of the application.
+
-- 
2.30.2

