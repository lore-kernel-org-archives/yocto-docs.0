Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA5CC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:54:53 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.45])
 by mx.groups.io with SMTP id smtpd.web08.9229.1639389292639537787
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 01:54:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=rQUqRMl9;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.45,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur1B67hO9C9wk8gKFfUbZz4R18IessypiB6RbrbW1ImTydNflr/eAlU1rjGmKFUjyG9vXpymZUIxRYvw0WtyQCMYzebP3DbicdLg9ccO9Ce3DyfDDzJi623+Mb2R2+LhOz/R4IOX1S3EspogqJajmb1jNdgBvnudRtlM9BuqvCk8YwbdXBtN3EYav1KsKiDQmxAaMu5UDmpntcWYjvxHnqsGIqvuMycdmAmO8n5NwKIAJbFaSKdg0Z1op3Ii3g6z+kZWX5vsRQ3SPxKG3s6SUUzXX7JXrdQ+PzHOCS/fhUdQA39sLUVDrWlbrrT+w1xc9BnHlmJxARlZVbF9B7sroQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+/WDOegA3ZntQRqMtlPYbtVQBm5afEwHMo/AP7VqI0=;
 b=hE9DIT6wDVGMcAYgovwjBAmtjWn7O4dtAKUWQssuC2fGU9lYzOCV4gCw8A6LZc+OoSl+y6dPq7/tB6ByZgDki/BPL35NRE83S57fQwp2HjZdJe5wRbwT5lxP22wDky+srWJY+1MUmxELWLqlyEuRuhIi1TPTNf134r7aPp2Jrm++RXMzgnqdYjEioA6S/jwmPUEmbgZ5DFEZMt7hrUE4Z4YyFCnwYVxJOUCXWVvRpUKCVzmWcNzPPVoXRI5S6SOQU6V7KtpctWFE/cyIqldtxTHRiKShwg/V2lGOZcAhpuq0uiEOZFRPtI9SHuKGU9xvuFQy1ApKrK7LBtRugWy+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+/WDOegA3ZntQRqMtlPYbtVQBm5afEwHMo/AP7VqI0=;
 b=rQUqRMl9+6BUfXGUr6iLDtIiKbY6mPnL6r08Mii2dfgQEL49ACYQS08oMYENNvN3/BuzKfhFWhB1aHQ6I6C+4lCNeAD5aDktb0a1mSGojRNOTrnEPaGi6+zfMzbOLLFjV3JRpF5VNdNUWNY6KDa8ygM0K8vNFDtDEhsqi7rZ4fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 by HE1PR0402MB2924.eurprd04.prod.outlook.com (2603:10a6:3:d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 09:54:43 +0000
Received: from HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66]) by HE1PR0402MB3355.eurprd04.prod.outlook.com
 ([fe80::905c:4765:6fc:3c66%5]) with mapi id 15.20.4755.021; Mon, 13 Dec 2021
 09:54:43 +0000
Date: Mon, 13 Dec 2021 10:54:40 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [docs] [PATCH v2] make the documentation a bit more inclusive
Message-ID: <20211213095440.qwg6cczqbfdr7fdl@fedora>
References: <20211206150401.30444-1-foss+yocto@0leil.net>
 <7adbcaa4-ca84-fc42-b08f-a96ebf522082@bootlin.com>
 <e3a61e6754f81f0c54b21c9ca66296f91b53af8a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <e3a61e6754f81f0c54b21c9ca66296f91b53af8a.camel@linuxfoundation.org>
X-ClientProxiedBy: AM5PR0601CA0041.eurprd06.prod.outlook.com
 (2603:10a6:203:68::27) To HE1PR0402MB3355.eurprd04.prod.outlook.com
 (2603:10a6:7:81::28)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR0601CA0041.eurprd06.prod.outlook.com (2603:10a6:203:68::27) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 13 Dec 2021 09:54:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22d34a31-425c-4e04-1a69-08d9be1e9658
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2924:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0402MB29246AFD05B22BC9239FB33CC2749@HE1PR0402MB2924.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k8mY22BXxqM0byqC/Vt1PZch64QqT7Uvk9og5hvkVDCgYkiDv5mgNziWIl4Q36B9oK57cw9VWoQeiZJWSoBxBDhIj4uXsqTQ2wHFICeIebPm2AZ3N3EmaP274WFD2nBnxjUf1AtnYVWc3fH6rbGfY8Z9D/6pgqI5vKRK32Np/TJ/vN2hdF9OBr0Igw53Gf4M+MDt8Oa5Zl7HKJec+nUMVIMtKB9zY4u9bUlRoDXQIeDAOvhrd011LjBVzwn0k2qp/i70Hctmw/pu13l4u72dILRn0pBvtgbh0Uc+1Q/EzB+Wm8wFEyA5oySjMuQQUguG0gKfOtM/YdXJexkU1UwmiXYgWT3n+FRjpqHBHMKNeJB8BVgklVbUaCsqvoyAQggzYfti5yVlOmyzF7Dtfr8pw7gDs33wE24WyGXTuGDy0O+QFtTBMiBD1C5LPoVbX7kOQGt55XffpgEBjpA9368SV202klkUA+aCB0OXLwbmK6CLT8dI8CB35Q7ouHLqWVrXxbogq2omC6CBGBpOM3a2PzgDkPtbEQdjS/vbvCq6acY8iATH8xbxuTU8VrubaKEdeQV0y4dCJdgggOUXXqiuVQW0NK6aPnLfJGmC3y1lIelWYE52Mku6NbBpY0A4/sKVeRnk9utDISNyzXC5yEAmmj57R7STKVeFtte9CKUcRcoMOAdmd5ESgYPzGkgx//57h+edf+cEeNYdLunpeXOkqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0402MB3355.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(54906003)(6916009)(1076003)(66476007)(316002)(66946007)(44832011)(66556008)(508600001)(38100700002)(9576002)(2906002)(38350700002)(4326008)(53546011)(86362001)(26005)(186003)(55016003)(5660300002)(9686003)(8676002)(6496006)(8936002)(52116002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VzDd+QKoOtrAoXgxmV9yzLIfh6CVbfLMI/Zpju4W+hiVWBs8Xva55ViylHRW?=
 =?us-ascii?Q?u9ti0nq/p1EIIqPaeEZAsXA7fHioRjS8O1EC4cgIZ8ys5gk41m9TA851butL?=
 =?us-ascii?Q?iHKRuspJl2HX/loBm3TtlmT1ktFwuWZcytp0X7Erk8DGDXCprv335QIH51Ij?=
 =?us-ascii?Q?LnWqPTY2pHBBd5lyHqxdCnBk+wUvvSgb/vjfqxDmRouEILq5NdI409cDF8lF?=
 =?us-ascii?Q?IwAbtSKxaQgLvswbK9Ng192HTRe4ExrSB2ZyH51M1UWn62DGteRpEFvgC+7E?=
 =?us-ascii?Q?O4FE6qSjxPHqhkstS1Uw06Ya02W4eunyeEWbbLEXeVKXn/DTY1Wmin2p3gfD?=
 =?us-ascii?Q?RBUn1BVAJNw3CXl6WWZ9ggh8i3FrtLPjXNAfFobO9+NjHGTJwKdIKPiaxrrY?=
 =?us-ascii?Q?OPLiOP3Co9cj111aOieWtn7HSzJkOB0GilEPB555FrKc5H6tG44nx1nNs/wB?=
 =?us-ascii?Q?GEjbbj/VzW9SVO0U0dijm2i0IfPFMc3iYENOV7Flu9hMZ0y7m3oWTYvp+q2w?=
 =?us-ascii?Q?OAEq+9EAEdNmFbiOcg3/FlKJLh26yBKtGTayrWaup4wfIHGdr44YQKW4XpYy?=
 =?us-ascii?Q?a9bn5x11HbX7OQPXcVUjX3bzS3GSch0Ch/JLX48FXJ1C55eBeyJ6PRXT1/r5?=
 =?us-ascii?Q?I/thmSGjB+e4KuthLS4Jwf00LgD5ES096YnkKdxU8YFU0VfoWkB5EAV628bM?=
 =?us-ascii?Q?6Ni+069V2vZzPlu7kjLOzBrmpxFdwniFyorhmEt8B/kmFm4NHrepvk6oD1LR?=
 =?us-ascii?Q?tCvLUgITz12/zavAOmpsD+atxuUZtqo+RgzJ4TneLNwfMf/eUevFz9NKdDlr?=
 =?us-ascii?Q?TzCxv7r7Wb56RwMBaoOBEIKcmOpclhYK9h8ln6EOpOI1XTHGp/ITxQDmnh7M?=
 =?us-ascii?Q?+MsisrYtLeF1Vy/G2RQIdXBPbTGLHrEcfAMwpR9EjlzEf13OMSu0+71VWFbI?=
 =?us-ascii?Q?GyqwTq09Bq6l742ef50FFlg4oxc73Txm1KCQPaYJVd5TXHQ6RMK/PcKO/6xi?=
 =?us-ascii?Q?Wvn9fg1ZTykAW1xUHXpcHu53XrZcYp0w/wichMqZcdoZBzUjIDeiLAZwzm1/?=
 =?us-ascii?Q?HQEIc9jBV2h2Nsif7LqgC9j67EPI1Arhlv/yHAa6uLEX1pBVcpNTtAxaMJBi?=
 =?us-ascii?Q?aaDdxnpIS2h0JOa7YuYg/ZSmMyRdkClxOC2l8UYNuSvgJI9tOq+fH8nJFy+H?=
 =?us-ascii?Q?d99ydAnUGU9lrvjyG0/ok0YpQ3+++H3ZaYBcvFDz36+gNp2IuAVC0HcLUmoA?=
 =?us-ascii?Q?M6jANtJaABvU4KhDX+HVT/D+i9vq8JiShLiM8hErmAIo2OZjqsf0KqL+ZWjS?=
 =?us-ascii?Q?2fw23ASNYEPcn+0QZWztKqrKqghbdpKBJRH3qaQMcSNS/Ca7VgBKXAGlQ5E7?=
 =?us-ascii?Q?XOK0G7af8rsf8tgQSXzQWEEQUhBEXcks4so0HPATvXMfAs169bngfS9B0umx?=
 =?us-ascii?Q?xxjhq/TCCjYxfD899MFkVRXwLcCzR0UvkIoKohzmw7uxO7jaXf970DmRef/l?=
 =?us-ascii?Q?NdyH8X9qIsyhLwpO8m8iv95HfaOm84A1P7xZ/DhtbzsxVqAmfSpA6M2/EX/B?=
 =?us-ascii?Q?gxJFOJXJbYKfQCCeO336mQPqClzMjntT3qt7cJyvUN9MmkTQJCyKat2pgc9A?=
 =?us-ascii?Q?h/95Rw49ZrDGNSZ9ueu1wyoRZ86R56mJbU7+fU9/qAjxkbcQfTSwpb7Q2KiA?=
 =?us-ascii?Q?NUUZm3kham1zKLQwJ38unirUrwrFG0wRStscgJc6p0I+z8mu8mdzz56XvXnQ?=
 =?us-ascii?Q?GgPsDj0nMQ=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 22d34a31-425c-4e04-1a69-08d9be1e9658
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0402MB3355.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:54:43.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2bX8Ea/jQtW9+KqwcOi5mKhmdubOlymOmGvldg6Hc6QGQ7KrvqAtHR1xoIuEKoctQrEYNeZPe5sZEJAq3bBKbk7slgXoPQazuTzL6t0DNPBse/IdOixD3wyG0JDjV7AO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2924
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Dec 2021 09:54:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2241

Hi Richard,

On Wed, Dec 08, 2021 at 10:45:41AM +0000, Richard Purdie wrote:
> On Wed, 2021-12-08 at 11:41 +0100, Michael Opdenacker wrote:
> > Quentin, Peter,
> > 
> > Many thanks for the long patch and review !
> > See my comments below...
> > 
> > On 12/6/21 4:04 PM, Quentin Schulz wrote:
> > > -For automated deployment, a "master image" is installed onto the
> > > +For automated deployment, a "golden image" is installed onto the
> > 
> > 
> > I was about to suggest "reference image", but all things considered,
> > "golden image" seems to work better.
> 
> I don't know if it is just me but "golden image" really doesn't work that well
> for me. "controller" would be the terminology we use elsewhere, e.g. the
> autobuilder. It says what it does...
> 

I'll have to read a bit more carefully but as a non-native, golden and
controller image both don't carry a meaning to me. Like, I don't
understand what it's supposed to represent (same for master BTW).

However, "golden image" in your favorite search engine returns something
related to our field of work and you can more or less grasp the concept
without spending too much time. Typing "controller image" returns images
of game console controllers :)

In any case, two things:
 1) I should try to figure out exactly what this image is for,
 2) Maybe a more explicit definition would help non-native understand a
 bit better without digging too deep,

There's always something we can do better :)

Cheers,
Quentin

