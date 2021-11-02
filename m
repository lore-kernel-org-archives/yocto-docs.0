Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FD8C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 09:40:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.66])
 by mx.groups.io with SMTP id smtpd.web12.6982.1635846040230682014
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 02:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=mi9szkf8;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.66,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFV7zv8ZEz6WxEdkzNO6zhfoTLerzzjKQUZVEFujcnlP6cq6j91NUrAQv5u9ftK7Fv6Na5EVYG1i3DII9KzmSdw1uZBXwzpHx0pzfQh32bsM28xLsCwxvVRe7d7Ho5i+EkbJW7UY7Z3fQoF0aMdGev0TBtmRH1nwtsWtiSRytSeeVFGXqkHbaQKN3SAGBM7VNcJEWwbESGsrsBqtrWTvJbbTt+AVJypc5Sz1+iHlh+HPL/Dpg1+Ge9Y2ZkQpHu9ntiGhm3f3xifopVOCYpM5N000JZ7OnTZUinmvSpOnnhthG+hKM2cE3MCgJxhZmtepjmlW6wMDd0md/xsjF1p4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGNZ7leNfeLYTGCmr3pDrdyc2jn5H/9/ig/54Y1z12M=;
 b=FaE8FLXWdhrM1kTCxvkhP5vBVmcJ9VYSyMMUZWSiN0ZbA+slWBFR87a03U9AHvI5JDSBvzlwzhqXVbOVlT+pOsX2C8FrdgevDD2DD27NnRz2z5NL1Ud2WnMwyta+hLDLLmmWfrbbWB5ESoHYgmOS26vsXV77n0dma170DVHDQhBAAgVXHY+RM8DlFn2lFHJ0rP7RdUb27GS+YaaJh/D8PPBlN7F7bkXSo9O9jZFbMZV+fVfXefe5xRmVKMewnbj+VHmYPsgzEnPRzMITBfJyDiWfMHZuG2V/6nppXmxfP2RI+PJfzwuzYiPVL6YRmkIOXtH3qdR6WKjjfXDvgPMCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGNZ7leNfeLYTGCmr3pDrdyc2jn5H/9/ig/54Y1z12M=;
 b=mi9szkf8xHAwc0+X/P1eF7JvsTX6kCCCYy4pqHTn7HKBGUH21LE8tNpj/WCqXfRITjyOhwOGjGLdAfdgiDBpuL9l5rU5tTPJDPjYutS80nm3aU762eoYYkSFQVDW2Z1x1KLIKe2wJ9xv3Zvd+6ap6DvJlDiF2IxovojaafcjG2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR0402MB3524.eurprd04.prod.outlook.com
 (2603:10a6:208:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 09:40:37 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 09:40:37 +0000
Date: Tue, 2 Nov 2021 10:40:35 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Ross Burton <ross@burtonini.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] ref-manual: improve documentation for
 SDKMACHINE
Message-ID: <20211102094035.optlst2mniukat2m@fedora>
References: <20211101122219.5965-1-ross.burton@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211101122219.5965-1-ross.burton@arm.com>
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 09:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d5c06a7-6504-4b3b-89c9-08d99de4d338
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3524:
X-Microsoft-Antispam-PRVS: 
	<AM0PR0402MB35246B5CE6D650C07D7785B5C28B9@AM0PR0402MB3524.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wTfcklNSzt+Qu+sApq69myhseg9nTs0L3WZpaDi09FEsFv3Zl3J53x3InLoa+62yFgQhblp+25TmKvMmzk2IIXqyGXmRCO7CyzAgAVRwmXogVZqxp3QtKasMKZ1PHUVl4ujxvjQ/2A8Nzvkc7AiGMuPR8zlk7SDQgeiZwyAPWYwThk2Ze3jT3IikwADOtyaQO5AagYi9NcQoYLNYOE11KPHM+IwhUc3nsDkzeVHV9hRhIXd1tzr1kJvJ4p0NS970P0k4WyXRFsjDxi90oarNrcRuPNv9bWakwySChmGgYZyMkzuitJk+jIDsFMQ/1jy/LOQ21XuLE2GnCSOZA3uNw4xSDxVFRtXieZp11Q5xrY/DgtYWW05AcDCMuqz0lDDiDyreG2oLK8Iub5GuIVJFCImI5UhV/X6grK2McOZD47sk8bml+wEXYazIbkIgeqy/9YUEARAQHK3VxSLqY0DYpjava4duNW+tV2U6XYU7zmmpt/o4LjhqL0L8Vb3pYi9V7S6oeI2k8e+zklIL0Z5grxG2soxTfDuzgG0PvLvuPCYb3QzJvPyjFTSWWkQLL9MDoKa5r9JXDxn3+UR7BL15v4KDHcCK6iD97e6W11W4D7d77ZYUlGVSnqX0r1d8gC7nnT2eiud6fUZwXKQujXZhvF/eYFJdTtOf9vbJFYJUc3dmNPFoUoF4chgG55zU+a93o/dhYZ2x1CDawvbCA1mD0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(86362001)(66556008)(38100700002)(66476007)(38350700002)(6496006)(66946007)(2906002)(52116002)(83380400001)(9686003)(6916009)(956004)(186003)(55016002)(8676002)(9576002)(33716001)(5660300002)(1076003)(26005)(44832011)(8936002)(4326008)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bacBoO1VWQgLBIBsKiU8ARXpW4D1JcDyMDsX9/Glk7ygLi9xs+TeQ7dbPDR3?=
 =?us-ascii?Q?BHe/G+EA2qW6yS1vi5YPVZ1zklfqZ8RKf75nNCvB0S7xwBIxfQCyEJ73wtI3?=
 =?us-ascii?Q?YXhm/4agcEm7KSRVSgS+oi4Ght2lX6Vg1OI2AJmbcKA99/DOf1ammz/5aAfY?=
 =?us-ascii?Q?EjV2jfvMsG4wVeXznz13XHbK3+9qmskKh0MEEVtJhjcc/jx7stebkOBT1Q+q?=
 =?us-ascii?Q?6y34oAJYHPWpIsXe072KSB6urs4i7J0SMOhxvihh+TGkf9jh0kEGy3KCCdhV?=
 =?us-ascii?Q?crQYwBfrOxy23J9uOxQ0MDSUR0py1/bujsM+JqNDDf96sfYMaBRbwdiGtv3V?=
 =?us-ascii?Q?sTgppzjUgFnCHOsPVUAVjQXPMHCaKVlgl4YHn3COTGuU/gRiYeCDHUURRaLV?=
 =?us-ascii?Q?ADJlnzwbleKWB/CyUa+giz+/dYz3QSl+ck6XEsu4uwxWCXAA8H2mj3KFP7SE?=
 =?us-ascii?Q?NyWjCfjsenWl6nJJjfchMF6dQb1eSnYz9YV1z5bBlEwizpHjfIp3jVk4wyjY?=
 =?us-ascii?Q?KEZBZXvOFQLeIZ/CPWN8nnC+ESSxzwlAnWXf9nZZuks2qgpw4PwYKytjdWKI?=
 =?us-ascii?Q?+gGzbA2m7+rO9spTrUGkJ+CwVpN+jjAzgw8ImOoXhLPGAduSlVj7Mxg87PmF?=
 =?us-ascii?Q?pAkSZBKfduFxbrMyFciGaArPM0PcBmhrJhLJzsfozH/SmRhRvLmMb/bhdoPK?=
 =?us-ascii?Q?zdM6TOCHpD8GBUGK45nfk8rdAIvow33QRrxOXJFgPNnjZaFtazR3oCWPbYMo?=
 =?us-ascii?Q?PfGFSvTm+Fj7+wX7E37AHnUtzKa7AnYnIu6VLYNperqAqC2FdJkTDXZQBpIg?=
 =?us-ascii?Q?mQs9kcO55ee6L6Viom8KTjvoAY54S5TW7wqf0+6y9tGcIGgkTIqCvxDi+l3R?=
 =?us-ascii?Q?aZeHxQnuUAo8Fydp3zEBB74hlVSw1tXuHho/Jc7fYH3FKbAttGb8E9BqHwk9?=
 =?us-ascii?Q?7XU6PkLFl/jN16z5/l/SzKFsj7l/UitkdGymFGAkmb6IiIRf8iMk/LWxIPUJ?=
 =?us-ascii?Q?5i8elJC3dEn4OZj1Z42YFhm6zS8L2RQII/eCfg8UcdpxFHJIeGjeM5Ofb8Zl?=
 =?us-ascii?Q?qvZm3h2js/L0CHTv0IQKo8gO75QJk7szSwHgUHbpdijN7q9y7dmULQOvgoGR?=
 =?us-ascii?Q?VHqJtIn6FGN2nTIcA4W54jY92nP5asTD3DdZDjL3YI4RUMbmGYK7wAw9K0W1?=
 =?us-ascii?Q?hyYzQhAEBjh8l/zPxaEbv8zme9RUIWY33Gjwou9PUxfiLY1pe+rxvX7+NrMK?=
 =?us-ascii?Q?XYLkb/g1RmE5Ixjr/zF9TZXpPD+h0GdAeXngJeg3MMOjrOARFFKFNKLyoClE?=
 =?us-ascii?Q?NMSBnbLXnCR8eqeSWz5VSLg/v6/cQsHDQAc3n3Y1/gGJxau46Tbg+UrYgAxx?=
 =?us-ascii?Q?2wuf84qpzJerK+rFe/C5smNLnXGdhH57niy6RlEdZr5UUT5++4C+qh5C4K/r?=
 =?us-ascii?Q?dwLs9F5u1JHmly+vB9Q2pnWXGWvALysPPqFjp4XKfxogmhUKMu2fGvW1laCZ?=
 =?us-ascii?Q?EUNYB0BF24PAug2wg6wql2vrB3fce1UwXzDIobPx1fP9q15acMnogUJwWc8O?=
 =?us-ascii?Q?jkE8nNapX2r1r2gOsg30pO7Ozf/iOWf9Fa4LMef1AO8MfYZxne0VNLfrSQYu?=
 =?us-ascii?Q?p+o51cz7toc5RXIgQKGgrfEgyS9tXp3QRGWaW98MFGR6k+Y3elsj8JSXWa+7?=
 =?us-ascii?Q?7MubpCfkcX8huNen4Dm+t2zHSkAEN+l5DDUVL/QPGx5D2xQ+fUiTbihN3yMD?=
 =?us-ascii?Q?rDvARcjJNg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d5c06a7-6504-4b3b-89c9-08d99de4d338
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 09:40:37.2417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wjV2eDkszPH1UByCWw4dni3n/tT5QsyOrbO5vIUJ6VoyyvmfFzQ88n/z961FMY+/xzUtxK+TBlB3QoVqyTY6HpsuSs7ydzw2WrgYjj81BAF85A26aWYbKya2YdfrQaCi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3524
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 09:40:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2060

Hi Ross,

On Mon, Nov 01, 2021 at 12:22:18PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  documentation/ref-manual/variables.rst | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b9e97719b..1389bcc5d 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6756,17 +6756,14 @@ system and gives an overview of their function and contents.
>           $ bitbake -c populate_sdk imagename
>  
>     :term:`SDKMACHINE`
> -      The machine for which the SDK is built. In other words, the SDK is
> -      built such that it runs on the target you specify with the
> -      :term:`SDKMACHINE` value. The value points to a corresponding ``.conf``
> -      file under ``conf/machine-sdk/``.
> -
> -      You can use "i686" and "x86_64" as possible values for this variable.
> -      The variable defaults to "i686" and is set in the local.conf file in
> -      the Build Directory.
> -      ::
> -
> -         SDKMACHINE ?= "i686"
> +      The machine for which the SDK is built. In other words, the SDK is built
> +      such that it runs on the target you specify with the :term:`SDKMACHINE`
> +      value. The value points to a corresponding ``.conf`` file under
> +      ``conf/machine-sdk/`` in the enabled layers, for example ``aarch64``,
> +      ``i586``, ``i686``, ``ppc64``, ``ppc64le``, or ``x86_64``.
> +

s/or ``x86_64``/and ``x86_64`` are :oe_git:`available in OpenEmbedded-Core </openembedded-core/tree/meta/conf/machine-sdk>`/ ?

Please triple check the link, I've just created it from memory.

> +      The variable defaults to :term:`BUILD_ARCH` so that SDKs are built for the
> +      build machine.

s/build machine/architecture of the build machine/ ?

Otherwise,

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin

