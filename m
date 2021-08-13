Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.73])
 by mx.groups.io with SMTP id smtpd.web11.34064.1628842901036614386
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 01:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=rcaXje57;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.73, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjfeFGn7xvwszxm5uKpgqjj8PKlV4N6lLCfTIrJxBfSRikYrNlJxylmCe5n9FfriP5AEg+ip0vgGAuj+iqXaAlx/8+C1M8Pb4gygNi6koTqpaCbYzt95t1nitaL/IYdsEd6JsQgp7lOB0LhT35BIPQ7d/DF0un+rRIG7sRTc5NsrDrciy64G2kEd3rsf83zQOhsBhUOyRX+/wj8Gafeddi9g+Dj5Ai/Q0z+Rl4mw4jdEJmrSena8rZSAAgBA+Z3Aq2kY7tOHbQm9YwdKIAZl1cSYzaGwuZc9pKc7/tB1QnESlb+zWknMDr62gfO5lJ88uZ4egyvN/bRJYj5GW0VssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeRG8K3f++Pyo8Jrp4RGddHyVWzB4ezlTtLr2+P0GtQ=;
 b=nnlnjdk9ZHD2Tt9TTseffydUclqeN/H+5xyt8ii7dOL22zr/u5Isgf5yGkdyRuiw3T82GAahqQPmoi/yjVONd42CjEnzGi41LaSLLJwiIFLzY+7TmtpLqlUEVEjtbNGGI9QECR6jrt+sG50gdCiPOT4rgTKmH4SS+1VKi767ukvS2awHMlDthTGXe9xRvtq+CiU0nxrmLmFZ1RUIPYmYd1uFlqR2+S35Pgv37klX+c0fCcubitX1qKmymGSXgje+ozAXtloBBaorplZevjWwSDlCkCyYzmrE0GEbYUITKCuuL7+DlK8aZgrnm0Ugcf44DuZObt0grv+FVeQFrd4QAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeRG8K3f++Pyo8Jrp4RGddHyVWzB4ezlTtLr2+P0GtQ=;
 b=rcaXje57A+/48k+UcWSvB3Qy4uhoy+9dEcvrw7PmlupaMhzu7cvHynTLGUt/Ifac7yGiOCM0lsfR3bMzEiGIhvCu1YUTUK88roFQDmNjT7a4FOvM3U8QtBg+5zxuOcV1xaqv4R9Ka6TYni4iY3l6enT90X8vIQ6a3vv3OXKdqPs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB5458.eurprd04.prod.outlook.com
 (2603:10a6:208:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 13 Aug
 2021 08:21:37 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::cd35:af76:7542:4dd6%7]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 08:21:37 +0000
Date: Fri, 13 Aug 2021 10:21:35 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: Tom Rini <tom.rini@gmail.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/3] common-tasks: Add a summary to the end of the bbappend example
Message-ID: <20210813082135.ht62s672l4ap6agm@fedora>
References: <20210812161027.580-1-trini@konsulko.com>
In-Reply-To: <20210812161027.580-1-trini@konsulko.com>
X-ClientProxiedBy: AM9P193CA0007.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::12) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM9P193CA0007.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 08:21:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7042357-a073-4d08-44b4-08d95e335ea2
X-MS-TrafficTypeDiagnostic: AM0PR04MB5458:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB5458C1BC8F656483CE6AFFDBC2FA9@AM0PR04MB5458.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nVNVgILFa5wEWqI1iVNheNA1h3lQ6OFb8afdheQesBNAkh4Pnpw9gO0DqgwgCUAhxirFhemJ4Fn4uLtUJVdGKq3gregua806O75yUhKCrxP+lYM0avk/a/Dhp7KuCGJnEwzPkRKhclna1Gg63PA6+hPHZV6UP+77UP9FF9WzNyr4n44j+i+XXeQywpHXfbCFHAeZj1YUUGtYfcikTLS/IQzX6TJUuY3gT963YuBofQnrN0MNezeKPFlX4WDk0OvStqVgkOOXtggwBiXOrKEMH46/MLcwATN0ybL9D3ld5DB8ZL3IiQZa86LY9FzIe1NriSnAIUW+gOUPNVl8EvRLCB2hruy1/anLExq2x4IGIbuPK9LO/BFDv0pp0wJIGVPqtHdJ6ExzK//RvZRYJ1oOBy0+RpvkBs9Xopq6xdn3p/WZ+oTPh0fOYA8UQfiZ55Nr7XycFSsmtyY+Wg+zgBt+dJnYnrZntrUH907AAihJ8NVlvUjN4lqMWsWkrQ5K400WUyGoLkB8H1lCkJKBaWXH0u4ff22Q4xtRiVXIIfWkGhMYkLNO4j8olPw1KZZqx5rXDv7K11nUBuB2dexvZ62iFeicr1u+2uHZU3fpFWNfH1kKD/qHgNgyQroarP7LwHfnZjxWGKOekPMmiwVnYYJBs+ZL8RC+rUy5+C1nP1iKca77gbnfydUj1KPVAcLsJkqy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(396003)(366004)(39840400004)(376002)(9686003)(44832011)(1076003)(55016002)(38100700002)(26005)(38350700002)(956004)(86362001)(4326008)(186003)(9576002)(316002)(8936002)(66556008)(8676002)(66946007)(52116002)(6916009)(66476007)(6496006)(478600001)(33716001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+KzziIe9uQECf4EHnNInxfQSTDjsjRKjYeYuxTf9YEqGt4XKnkI2cZnvzWzF?=
 =?us-ascii?Q?9X0EwiUjOGBEvKVQ1tSdO+7ngq9iXTF0z2ZKRjfwvAd7RdiBirJSB0HhFR/q?=
 =?us-ascii?Q?GtyJEGTwA3+AY0bDkRnvfVtUCNChIRJSj/ZyCbXXGT5T9kDkD6uQFuNcf3bk?=
 =?us-ascii?Q?ps30bnWZ6NVNAWKVFy1owPMz9ASKRlftrkugIH3QqxiZwGlQFvPvn+/WbMLE?=
 =?us-ascii?Q?fB4Cg+LC34PgIezMQQzXjwsfWFbTeMKBjcEp9vctXpoKB0Mf2lxuHI6Q3no/?=
 =?us-ascii?Q?b278Ykfpkck9O+DfABwIWIxsbrgNe3khdQ0HHn1GO8XYdClPYweuhys+Kk+y?=
 =?us-ascii?Q?EBKAaaav+Uqu+LmdU8AnIzTI2ZZV5S4zzpW+hcqqIBwoOD8RWMjHJnDskuYq?=
 =?us-ascii?Q?6/lbRKj+Ae8huk1LeG/8ptTnG1nVcwniakW2WmVeAVQZ8o1JDrtwuOE3lFK8?=
 =?us-ascii?Q?SU+izhHu4CDNnt+5HunPM3+gRD7Wgq5NRb4l5qpUAQZo1iRSfwueqhexhgrD?=
 =?us-ascii?Q?Rh7O8uZwAsYK/sNohlAcPV1/N7T1hcoPJxkkKwLje/tEWNnllulB7+/hLqky?=
 =?us-ascii?Q?6yJF0LbaF083MqkhPGK9uSFsW8VwudXpzOvLIDlL4Sg8nI/svOEIkd+Lf+b4?=
 =?us-ascii?Q?Q8OjHinsTU2o5AN6QHOwTRGREonPOCeA6Zj9bnEAY8nK5Eb+XJ373zwMieFd?=
 =?us-ascii?Q?NmKmflO3jal+5OThKv3j6AHpT77VuyfiI/o3kpyVJwcyEcaevuPQTELqliM6?=
 =?us-ascii?Q?nGE28HTnw8Ao2akiz970NIOaSlckfx0Pw1AB8vqUgwxu8tI0Qi/O6wdzp8mZ?=
 =?us-ascii?Q?9/oOjxNMpyx/+8YtV5xdA9GlKhLiL5gYeYSlXbYhLW6PB0rUYpmIngx5AdFc?=
 =?us-ascii?Q?/dSoP1wVbUPUuh5J9rsFFEOF11MmFFNe7NtXEFHKveEhmFxQuKMAohMbB9iO?=
 =?us-ascii?Q?1uvhpLXN7zwnOdQBnjnZTJTr+AsMtwvgcnsfzYX6sWnzBQIaT4PZSIhN+A9c?=
 =?us-ascii?Q?OgasbDtoEpObpykOZ8bMyBdYqvgR0PMqrWhnExikhyJNvZP5jJMOqxIoJUrN?=
 =?us-ascii?Q?yLBdVbpa8zZCc3dz1rOaQinhMorfvGiffvpchZkzKR/kwwSMu4bWymmb/UNe?=
 =?us-ascii?Q?5f4dp0G8EEPJZlsuxvlVjxYOPC7xNFUDUygzOfQFD6gsNJD8Fj3fShLfY/qN?=
 =?us-ascii?Q?6rvqXTPgeqFOlsUHuwKB2jChlVAcJN/t+VHgbCbkAmvj2aL3AqfsKt9+5U8+?=
 =?us-ascii?Q?pmwGtcRobM73uphKGtgwLQav9LTibFGXFOp7vConmnKcNgpqAYZKrdFZmDxL?=
 =?us-ascii?Q?tGf3F228dXJgcykdCpz2kS9c?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7042357-a073-4d08-44b4-08d95e335ea2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 08:21:37.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAoreS6gWCCRRIxjnmhT8bb7B+nfwLeV5Arv/NqDBOrvw5GSeQET3PQcFGlgzhfTo+IJr3PbLe81UPwcIjaW7sOF4EF/+xsQ4lMBpDUUjiKE8EOhL/G7VdUOdmOlljZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5458
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tom,

Thanks for sending the patch :)


On Thu, Aug 12, 2021 at 12:10:25PM -0400, Tom Rini wrote:
> is.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 37077d72d451..2d8ef96e2600 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -545,6 +545,12 @@ important as it ensures that items in the list remain colon-separated.
>     allow to add build options (e.g. ``systemd``). For these cases, your
>     append file would not even use the :term:`FILESEXTRAPATHS` statement.
>  
> +The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
> +``rpi`` will exist in the list of :term:`OVERRIDES`, the file
> +``meta-raspberrypi/recipes-bsp/formfactor/formfactor/rpi/machconfig`` will be
> +used during ``do_fetch`` and the test for a non-zero file size in

s/``do_fetch``/:ref:`ref-tasks-fetch`/

> +``do_install`` will return true, and the file will be installed.
> +

s/``do_install``/:ref:`ref-tasks-install`/

Otherwise,
Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
