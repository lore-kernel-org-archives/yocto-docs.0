Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABFEC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 08:15:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web10.11158.1632816923345175965
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Sep 2021 01:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=YHWHtinW;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.85,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKkJ4qoLb4N3DXL/lhPEJ9EC0D1qWNuOZ9XMb3oOfsdg/s9cBPWsCe552lP8BBS8OVYz+ujmU73bEKhoVbayevBzA7DOdOMXrAP+YW6gi0r8CcLx5C5SRb0++/IhIfyb8h7ozyOYRVF/lBaNuYQg8tHcYHUs6bgXJ3YdkjuhPsHXtEmOV3x1jQnQCZOCskN0l3OXJY4LEZMw0/LGaM7AF/JizUmXUpPyZSZFFndnh+0DalTT7t7DVUoS+lu5rv2QNorqIst51HzqXu1/QefrDfvGDuPDfXKsa2b8aTCWDtZ4wwEf5pglVyQwX9C3dGWh/RZS0abSNJQCe1dE/K3u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8zshk6CS9xc/qi5Bboqc0yFhTqcLnkeAzOPbelvSyVU=;
 b=il9YfdJ6CmiNWhoPHRIIRjUZYk17QCbplfzPeIn3dPzIhR98HVjwXzHMIzRD8FMikJbwEePkgqB+TFLSjz5haNnQ/qx6UBAkXsvSbyTGJKTMWNiYSuyyCzgMpdOIPNAUGc6CVtyV2zZXNZowGf4LpS1NdJRGsPhUWz5UDUV0SjtbAPgf7UBLcCGRi1YD2vxdMX1WPwPssl5rAa1Z0oWZTBuI4DAF9sqLDGpb+YvJbx7CatBCMUxQUSgXyTjolGAA1VlhNNo23J9Kum1y0s8qwJ671eqC9RQBCOhbidwQxFOJDeKT5ZIslU1jUR+fkURlahsoZk63yP45rxUJz/Hl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zshk6CS9xc/qi5Bboqc0yFhTqcLnkeAzOPbelvSyVU=;
 b=YHWHtinWrzN+l5RmEnaakiMY4TCeRY/MJfj5fzfenYFYUsXz7IwHRvMYTVXM5CerBuUaEc4FuwfhjRBWSU21EE0Gaw7sOuKUarqs8TO7xc7BR7d5ZRosilRQvC+yJtOVrtYVh7+Gw2bcPZnxrnulAWvN6yJOhL0IK8Ol5LdKepE=
Authentication-Results: crashcourse.ca; dkim=none (message not signed)
 header.d=none;crashcourse.ca; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB3985.eurprd04.prod.outlook.com
 (2603:10a6:208:63::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 08:15:20 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::1d01:cb7d:b647:46a4%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 08:15:20 +0000
Date: Tue, 28 Sep 2021 10:14:50 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what's with the "\" in SSTATE_MIRRORS example in overview
 manual?
Message-ID: <20210928081450.6wuanw7mm76rb2tv@fedora>
References: <f7799882-d01c-de7b-be8a-45c2cf6e1eae@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7799882-d01c-de7b-be8a-45c2cf6e1eae@crashcourse.ca>
X-ClientProxiedBy: PR3P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::11) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by PR3P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 08:15:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 202a402a-9f18-4cf2-22b8-08d982581cc1
X-MS-TrafficTypeDiagnostic: AM0PR04MB3985:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB3985B6BB679913F2ED46FE8BC2A89@AM0PR04MB3985.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OKK+DtJo+1Ia6YQ7rXBpY4uQkSMtAgjkx/F15vIm9aj44hvY7QYF+OZQGrzxtbHojH4j8lHYQL+qoyokxvifNfSpONxMfgsGzYNLXt6UXBviJULySeQBytZHbywQkDKJqzoL1mWpAixbUTJDvvPZNPbEI0EIhsN4Bs7N8atA5CfPt48NBPznrR5uCWzTNGO+BhtV08VvguDEQaxEkTCcUu1rkcrS0E0VacLrVyHfQ7t/7SUcGZIWFBWonXSTDs86Br2N3YataEscHc9N4Bs6wEtOfFRVmpr6NX+5UtZt5Kcgv++U3SfA93RmWQp9lQ64fGSEcdQEuPPiBik94MVUD4gmI/+r5SX7GVa2hAKJMHqp3smAaXNOFwtBPG2xc5gAUvS8aerkOKlORxRJvpBQc6KSguWgYRqUAkTcm8tTUBvBCiUqCpH5T93Lry9hCdSWnfum1S9vDW/3EVCBhuLrUDqkeQl7dXXD4OkokzalPPCb5dFwgqvVRtNyO9vwbN56odaPwSbTsvgyEgb14XNemRa8UOSY53Go5FdBPtHgKTD7lWVVCu0dmdJixA63T0BFYNh2f3OUhMXQHYYohw8+kPUQVGafigv5mmwyqlZbJJADoj1xoF9KfiJG/4bEfIN28vaf/n8n+2up2H4SHSkEPbqKk5mKsjOrwSqb0f5philt4rFl0g7k8S7K4TD4AEMP+lOSTQBAtKyqL8AH5rhKCcN8UD9zPuL2uOnJk2pPGY1+bOkHqeLpsu6YBqS1QsQ7GUsAPP252fYCrnmRTjruiQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(1076003)(186003)(52116002)(6666004)(38350700002)(38100700002)(66476007)(66946007)(956004)(966005)(508600001)(66556008)(5660300002)(6496006)(4326008)(9686003)(55016002)(33716001)(86362001)(9576002)(6916009)(8676002)(8936002)(83380400001)(44832011)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?chWcvwT37MqZnJ/rvtgFaaBtZdlv72ilKuNUHZh1oRpCGX5n22vT9S8sH41X?=
 =?us-ascii?Q?I3GMpK0CXtuUYjMNOpw7yoxudbTpIeSLUiF2Xx33d2WCjmI4zV+IuQjmOmKd?=
 =?us-ascii?Q?crZAYoUR1sPypgejsRO8GsAsZbQsxrVuLfnIRtjZg3U6bg3n/Y8iarAe5+1V?=
 =?us-ascii?Q?ZGdxzUW/+3Qxlh7E+P8MC6UPuDjDJvELRJhT+424JlPChekyyA5+0nKSpWSN?=
 =?us-ascii?Q?aVK0Y0yLaIGvUj03f6Z4aNZgvNSjENWIpDHiEmm1s1CmeD/kaFrt+VKlXNxJ?=
 =?us-ascii?Q?FwzELu3u3MeL6qxLhozAYsmu9t8mk5zwkUrmJbY3ltDsYWCP9XC//qp66IMZ?=
 =?us-ascii?Q?yyZorDe7fTJrRLIOeGh2jVB2gj/NNg+/eAPmBhgqNCS9eXaFxwz2B/4huBiH?=
 =?us-ascii?Q?4mmfk+3/ShJeKNF/yKueOc0du49YYVLBJdSy79Q8/y5t9OwWu9g+nL6SXZXT?=
 =?us-ascii?Q?CRG1mAjy5qOGmtWtjvaqqmrpBC2Z+q7feTuWBuu0sEgVRv2goiRYijS7ZAmy?=
 =?us-ascii?Q?vuTUnD3ioXN8IsDnUMKklbNyBWRcrOung7LleJQqbAc3rR1oD9Bvo7MY7eA1?=
 =?us-ascii?Q?rsx96Idlr25D6NPrMyICHTMv1ql4+2jGKuUb2pjXPF2XCdZZfCXuP7+HrZDX?=
 =?us-ascii?Q?L/Y0uqCtVWCIMh8ZPagqgfiRweMEIxro1dNTdWtdpMBOhMKJjZG9GZDR1R1q?=
 =?us-ascii?Q?mTPaSu3Xij4yJFB28+lU1/OWo/ydcmj5cDFk3CVnAiHwFAiXkMG0otd7dzWh?=
 =?us-ascii?Q?k90uZ8kkO/HEiOkYAgG3JHoBJwKp9cPvd5yhb39DTPDxGEMVxzOrnLskQ1CB?=
 =?us-ascii?Q?PcgOzIehILi9SdP0VDNyeeGfk7f1lUackODAgswmFCj2tMSUFa4kSHZzqVjO?=
 =?us-ascii?Q?PMf/6LPOE/uHpU/Xi/N4DyMAS0YCHA62AvtF6k5pP0hioqReyjNaxwnSePJB?=
 =?us-ascii?Q?wcWqPlYUz7zEM1rvy7fKB00Wq/p3uwSv6ocnNqwOzypGS3W9C+ZaAjcvp3k4?=
 =?us-ascii?Q?dM9EAmT7zAIt1QGSPdXrGGnNAgSRNnck42KmzrV5aibbG0fx3KBfy+6jsX+x?=
 =?us-ascii?Q?IrmnamikviEESHqTbr60MJb6APJAhLm2v7Zy6B/HpMmrTJE7SAfV96YxW8vY?=
 =?us-ascii?Q?/7mzIxCRUO4kdA7DSBumOM9Qy6MLdEraYlw/uY8qbaqMp/4AGxs0T87LwCzA?=
 =?us-ascii?Q?NRTcRzPu9TKr0P+jYMJLVUhULUmqMkHGFRNuFHjeRR/VbImd5pgbrWIyN/zp?=
 =?us-ascii?Q?H8rE+E4YD5HHh2Ya6EdWDmZwJ6noZkATu8jqd0R4q1yiV1+celD3xAGP/cOQ?=
 =?us-ascii?Q?QYcGoSkjiSlxybzqf76qXNHv?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 202a402a-9f18-4cf2-22b8-08d982581cc1
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:15:20.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3Ig1XAd0SzAqQkdkXUrOQKAOmxfsfOb6mzWhJ7xXUK+fO14lIkYEMkguNUkzPGxmpLfOQ1MhAAxuuk4FRQTdFKQXpkCAOZ+SOJ8OaxJtCx9y3gW0cmyK/003hBEZV3WX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB3985
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Sep 2021 08:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1892

Hi Robert,

On Mon, Sep 27, 2021 at 01:45:53PM -0400, Robert P. J. Day wrote:
> 
>   from here:
> 
> https://urldefense.proofpoint.com/v2/url?u=http-3A__docs.yoctoproject.org_overview-2Dmanual_concepts.html-23shared-2Dstate-2Dcache&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=iBMRw0D4E14V7Mp4p7EOj1bgXlIq0lFTp-9f5nnoGbk&s=g_KwAtXJ38EyzFMAmzfVCEUGZt8WjP4C8aTbr41h8aw&e= 
> 
> toward the end of that section, we see the example:
> 
>   SSTATE_MIRRORS ?= "\
>     file://.\* https://urldefense.proofpoint.com/v2/url?u=http-3A__someserver.tld_share_sstate_PATH-3Bdownloadfilename-3DPATH&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=iBMRw0D4E14V7Mp4p7EOj1bgXlIq0lFTp-9f5nnoGbk&s=ijxTmbCdCGt8GAHOyV_nDYONABR_e1JqCIC-b87jHNY&e=  \n \
>     file://.\* file:///some/local/dir/sstate/PATH"
>             ^
> 
> note those early backslashes in each line, which appear to totally
> break proper operation. it was only after i deleted that backslash
> that things worked.
> 
>   is this a recent change? did things used to work differently? those
> backslashes definitely seem incorrect. thoughts?
> 

No this is an error made by the conversion script used to migrate from
XML to rST, please send a patch :)

Cheers,
Quentin

