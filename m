Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web11.13895.1630309311867053120
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 00:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=al+FJydH;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.45, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuCE5U5B5rf+plJxjLRtIMMnjBlkeKYLQ17XWXWxRXq8BxYO7rxh58mtnHL3Fm736HSrsPmgCHkG0gDhtEj+3aUWnER0gEszimT9VkLp965W0Iorf/LGGWj074vyfdZsq2NWGgD1jCIkfVGVENBEkhWIGe/Mfjq/C/EFTLA9eaMxUFDMPbDPelyjjUVjR7YX6lRM55pxRFxtYzF8loCSU5JDbMhzZSZGE0+4HubXUjyhZ5hsW1ALYHVNjViQfhQfzirxnGOawPw5UUh3msTkdRT5G/4fbNrwMtXitCWGECRrkRT4gUKTGOnb/im9OyoTK40djKdFjeuSh869NtA1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLuyCqXqIa6tuQjDDpZqo8wm55D4h755QPDoiJmAOxU=;
 b=EIXKwxqhtyWwH9ZLMhoezKwwIVKZAohTTe828IvU2zfrimgfMIhEQk3wGVm+f5SYbA5vyr4gTjJRCCaDFAWyNw83pdLMTAI6l9J1ZKIReSBgVABpKSere1qhcxPiCX0Glppl1g1W1PzsoTA6XPeZ3n3cqpT+gqeU983OLpwiPsPdJrk8fIsBQIsgOcHnYPvcbgIfAQdxGGi6CROCMJFUND1BL7fpCNM6fLNw3PxqlOdfD9niG1MO34sUUL7uNRCnaSlJfdoqLaHj+v3hazNMV3bm8h8bnMH1L1TM4I38WP3olK9kW2iLWq1b1pZoqkGYMX4h9SdbZRDTkNeL5+T27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLuyCqXqIa6tuQjDDpZqo8wm55D4h755QPDoiJmAOxU=;
 b=al+FJydHwDKxzhqLCCOhhiYDCNzBOHjVBycIwgEgau+vj44Wx3UlvulCDDpofcTj1YrDmIDvYMNp4ZHH8UCRial3FOBcWmVDOICFHsbwqBemZsHoNp+I5Z1gFDtV3RgnEQxycNMCmXzb+ps8MWfonZbBlu5ULwoyFjeocootd+Y=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6692.eurprd04.prod.outlook.com
 (2603:10a6:208:178::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 07:41:48 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::706a:b082:742a:7d00%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 07:41:48 +0000
Date: Mon, 30 Aug 2021 09:41:46 +0200
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] confusing note in dev manual about search order for layers
Message-ID: <20210830074146.kspdnxugobsuznzn@fedora>
References: <ae36061-5fc8-6dde-cf3c-f939fcf983c0@crashcourse.ca>
In-Reply-To: <ae36061-5fc8-6dde-cf3c-f939fcf983c0@crashcourse.ca>
X-ClientProxiedBy: AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45)
 To AM0PR0402MB3348.eurprd04.prod.outlook.com (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (92.42.140.82) by AM4PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:205::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend Transport; Mon, 30 Aug 2021 07:41:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a18dff5-39e9-46f1-399a-08d96b899fac
X-MS-TrafficTypeDiagnostic: AM0PR04MB6692:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB66926A179823B9D34502957FC2CB9@AM0PR04MB6692.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MzTtbntKhwJV2y1IfiY70TmMTXRZ0Q3bcY7qAje1yvshgJcDGJ9Y6d04Ruv2gu60NWjkXvro30xvLFdsX/P3kthoWPWhNppz90QqZSdZh3AtYB+IepfwlIPDo1MGrSx2e8EL3gNCo3wf02m6b2zBUa3F1fWw09/Ok+25QQ4C+woMFDdQ6+x3/4pjgPO1E5XfrxTPl6IY2sBY2ChtoczoeYpdVK42blEwNKBTkqUbtYm8bJ+m2Mp6BJmq8J4InVi1wTo1cV004T2nXIC+0U4i9MbcQV4R/tDo6IXFo49V8pgUZ8Cd8V1Ke0/As+YeTMRicrcvTz64p8u2GtIY1RYSD5R7BYdL8JS2vIv8AHRU6bNN2DKNKjR39g/gjvsL7sIhxPh9FZwWy5VFRoSbKv9DOAFZxNXOnEhTThVn5h9P8QiQv2u3/hNl/l9iKD+swn0W0n6FD8RRvyBL0NInZwcqzu/mTYIIZO1c1x3sAGoli/VB4rC/+0rtfPo3cunepDaCMwnV7Ex60VBaprNROnYSWqNHapg62I6cpH6JTbhTL6Iom+b/ZHo+I/aj7FKBOd3yvNftVJbO7Fz+79STtDwpZVYz6A/NBqdW7cFPEi66WrrvqxWc96O8ijKL78EiVHsMwcypG6aws8oh6Yq4kgNU2nhkHyfnubAtbDBulP8byjPs+GEd55Pj7nM4FC1a7I+7PaSimqVMem0G4a3kImS0i/eDO52a8qJq+g1GFlr24z94QIEThqPuPj2XYj28nKZ42fuG9cDuAyhlJ3e2D8AIpxdhHM0KWfEFVGwDvqJDQpg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(39840400004)(346002)(136003)(376002)(8936002)(38100700002)(4326008)(2906002)(3716004)(316002)(966005)(5660300002)(8676002)(66556008)(38350700002)(6496006)(478600001)(9576002)(1076003)(55016002)(33716001)(83380400001)(44832011)(186003)(26005)(86362001)(66946007)(956004)(6916009)(66476007)(52116002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9dYsgK0oAjvsLyEs/WB2o1c672dWStfZmNPvIymeW0VF5zLjiyYK8gX/OvRq?=
 =?us-ascii?Q?sZh4frk+CnnoTl9SlM91Nc5rSCaiWXn9Fok/TigrfY6YrAx9ZvF396RzxPa6?=
 =?us-ascii?Q?5zyLbRxc8CjW6WbRdNuiWz5ZGcMI5KvVmRaMluK5fGEQMBVPXTkkIHdLMi+3?=
 =?us-ascii?Q?Or2jRSPpl9BR4aT/r93+nNSaZJdy/D2Gw72bamKbYCovv+74V33RnxVZx4mw?=
 =?us-ascii?Q?Uex4+h1l4hJp2DBgAuq5rb24uka47nT7DGCzaLLGO0cX18Ux+Gy538oyJlR0?=
 =?us-ascii?Q?L4mzYcR7BRgJy7tUr8lA6DmrGGl8PcfCdPqBjWCg3ANwxDkFotjAsw5s1Ljv?=
 =?us-ascii?Q?69KVOO4icaar163RBpyeObZxHJrbD+u/MlvDrr8DfX5lyTwtN3WdFPOYyYhX?=
 =?us-ascii?Q?0BQtmkM166k5zywijdoogvrFxUCOUSHRZ4dZ/KQLOor1Tsv5fksW8r0vxBco?=
 =?us-ascii?Q?m91PwdnPRqRu0JB9pMEn8XXIONjcbCRVsGm64w+24s3L++7yo+tdtq25zb1t?=
 =?us-ascii?Q?O1XEKN804ipLA0ZPsxJCmOFVdWraMFVo27vGIS7XHGY3o2GQ4iRo12U5tmrJ?=
 =?us-ascii?Q?U8uidiWYa+fL2CLVoUgW7lc4a+/ulZ2tAuM4fL6NW7X6mljqX4vOncwCFpRa?=
 =?us-ascii?Q?5aEPihz/lDVj58FgSX6bH/Xh4/7MwH54QI3ArG77qPKGBE5A93U52Qudzqte?=
 =?us-ascii?Q?6QOia2tfdquSDdlxV32FvgSt1KjyKjqwOU7GnwbxEBxtOz/X/FWfyHJY4vQQ?=
 =?us-ascii?Q?T0sUtpz+XeYeTcrNk/+tgj54aGu10J6/+PLbEDe35EzHFcujf5iXdhGCq5DF?=
 =?us-ascii?Q?R5AO+tkIW34GY5t4pGt//aJ7Uq7Y93mpjUAQYVidgelg1hqjqM5IkXSQNufD?=
 =?us-ascii?Q?rti2keWk6ppS5K+hsx9Bd9O18Vpq9bttdICWyU5UmBO8Bo0mpe/WRB2Y3qK7?=
 =?us-ascii?Q?vPUam7uhOjX8XCBQd2TfliHdoiWOPeYVbAqyVE/Btm7g1ca9KGc368CyCAPX?=
 =?us-ascii?Q?gmwfI57uxJvSRqPfiFIXWsknNqdzaIvwAnHI1S9MboD8EEo86WYmsUSddO5a?=
 =?us-ascii?Q?hHFUrXqsW4Dz9hP8HUBKc003A4dkxK8XWHX/yd/5pTPb3a7JsLbzK+xWCju3?=
 =?us-ascii?Q?U+PuWXkHVXYmJWcedMSIgyjP4tmWi6VsAmfSFyzqCaVNCyxXxhl6P98KJlGW?=
 =?us-ascii?Q?oykPekbPNCr75uzIzA0ldGhaF2VsXZ8N1pwvdfLzO4nc4r/jc53AQfb81wHm?=
 =?us-ascii?Q?260L33j7Fzcjj1EPYDmS12J0b2N8DRSC5tf9KHFyg1OFvVtre/80l59hnTm/?=
 =?us-ascii?Q?JfDobozJcv6TG72YWSqKDXOP?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a18dff5-39e9-46f1-399a-08d96b899fac
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:41:48.4630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrwpkP/HGhXIGUJLUchf0JWf9An1zxUHuvb5hLBZvVSmzQMpY0O5wg4cyGsxh/HxEDtXolL9d6sXtpkOeQjhJ/hIDoYibchcNZuDsmMUReMlVyASAUhTE1xpN6cRVFy0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6692
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sun, Aug 29, 2021 at 08:52:42AM -0400, Robert P. J. Day wrote:
> 
>   in section 3.1.9 of dev manual:
> 
> https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_dev-2Dmanual_common-2Dtasks.html-23adding-2Da-2Dlayer-2Dusing-2Dthe-2Dbitbake-2Dlayers-2Dscript&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=mVZiXFV_cVQVdgl1QOxle8X44ftmg_wTdRhHpubvgnI&s=5pEBxWBXxmuUiL2gZv_9GyOl4bi2YEQSOwhj70Kxt9A&e= 
> 
> one reads the note:
> 
> "During a build, the OpenEmbedded build system looks in the layers
> from the top of the list down to the bottom in that order."
> 
> ok, except it's not at all clear what the consequence of that is.
> looks for what? what is the significance of that search order to the
> developer?
> 

My guess:
All layer.conf are parsed in the order specified in bblayers.conf. This
includes specifically BBPATH, to which layers usually append to with .=.
This variable defines the layer precedence for classes and conf files (e.g.
distro, machine, others?) selection when there's name conflict.
Apparently it is used for require/include with "relative-to-layer-root"
path (as opposed to "relative-to-recipe-file" path) too from what I read
on IRC.

Hope this helps and is not too far from the truth :)
Cheers,
Quentin
