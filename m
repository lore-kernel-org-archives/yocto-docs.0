Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62365C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 15:16:53 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.133])
 by mx.groups.io with SMTP id smtpd.web11.17256.1717687010000679355
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 08:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Rmd+pTh+;
 spf=pass (domain: cherry.de, ip: 40.107.14.133, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSNaQ1X2Bw8V5+RxL9nr93D3gIYp4+V/KFdUI4p2orkJYchW9CqLBx9GwlEeTIiZJTXx/ql7orOH+NvubKXywNgeckEvh4DVbVgY4pXL9833MkZIzyPkAu++vXVlArGN5OS6ca4V0qZ/kDElTCezj7BiwZLHU+WctYkgG1WjPPFiya4gEm11j9VDpl1WYReU1JzbWNHv61t3TxKwIUzFDslEhxfONqe2oO33dlVwDw9RG4qJuL+ogOsR0C9DNOWkfInofcNAqgwaG7YXMQ0mxv6d3T8hbyCBWIm8t0ObOi0OdM0I932veWOrQ8yLTD0WPGDyEmKMZx+HfBRPcKqsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqI9Gn36S3/ct7l43q3YVmuro7SQW9g5sACu6Lf/aTk=;
 b=IwSaFnpWvb9C5RfaQ36vLxWzUfwhlSbYc1QmJtzHnhqgkTI33cqGZPaBp8uffROKEzHU8U52C8cIHJ0A5F9LQXwwR05KdjX0qEW8g4xozZpYqNXoksGJ5xns32gZdxoTgX4kQakfN0d06mxaaQ7Z5cbJVWnayUCvYbfx+9hPeRSCTpjJ7N8eGrbdiZRMLKz78AKlzjaHP4rjrjO15OV81wS6mrGFewF+4iGLzyAoqbChAyoF4jPEcSwJLiQ2/NlZP+VeuGbyq2XM0hXIz1EU9LZ8Sd6SGdR8cT0cUYZBSa9FHxsGL24tpfFVrHD689Fq8T6OE37fXKY6i8EkGBw5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqI9Gn36S3/ct7l43q3YVmuro7SQW9g5sACu6Lf/aTk=;
 b=Rmd+pTh+nNFCk/w2tW398B8R6sdApEitgZshDCc22Bg+Vs0HZA3oYqT1+8SJVgGqhb/kLb9cHxaxoHZUEzTPV6RvqvGvlGGyOH3QDQBZg8BIU8WVORXTAFWVTDTqLyL3gDNiEM37d9DEzsefqEKQdFVj6bCMLFS1lj5wja8DexI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by DBAPR04MB7304.eurprd04.prod.outlook.com (2603:10a6:10:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 15:16:45 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 15:16:45 +0000
Message-ID: <b8e9c6e2-1bbd-4291-911d-ca61a0e47dea@cherry.de>
Date: Thu, 6 Jun 2024 17:16:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dev-manual: Add info on build env initialization
To: jasper@fancydomain.eu, docs@lists.yoctoproject.org
Cc: aoife.power@iris-sensing.com
References: <20240606150410.69388-1-jasper@fancydomain.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240606150410.69388-1-jasper@fancydomain.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|DBAPR04MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1902d9-da55-4c70-7bd0-08dc863badc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0tDVWJ6M1cxcDNVVWlJckg4aW1BK2ExVXUvUVRHQUcrTzVuVU9EekZiUnVN?=
 =?utf-8?B?NnpZb05EeWJMdXlHQzNRdGc5YXg3VlUwK3pUWG10L3FWeTVNUGZUNmEycWZl?=
 =?utf-8?B?UFRvajdWbUcySmRCL3U3VWRZemcrdGlMcUtVLzI2Vm9uOEdJQkt3WVoxbWU3?=
 =?utf-8?B?OHlMamd3VG1wcjlIYWpNVGx4ZkIvT3JybXVKa2R2YUN2elBvNEVsRTFDSXBp?=
 =?utf-8?B?b0xPSEhUOWtFZEozWUk0Y1g0a2ZOS2xXMk5qZllzcFgzSU5wSlprbVhaUjl0?=
 =?utf-8?B?akZwUW93VjNvbTE4anl2SW12aVZqc2h3WTQ5TEpiYWkwdkxQZ0FQZ0hRQlpN?=
 =?utf-8?B?Q0tGcEJhK1NPR21wK2dTWmsvRlI3SzdmL29oRkE1a1h5MWYyQUlreXFyMk9B?=
 =?utf-8?B?R0o2cFduR0VQOU5oRHA0TUxieE9OM1RpS2oyZ1U5MGd3NnYrckp3azl4dTE5?=
 =?utf-8?B?b1lPS2JMdmVFM3NYd3VNQzl4NTJueXg1NDI2WWZVTk5JTkJzWGVoOHNtU0dt?=
 =?utf-8?B?R0FKTU5GOVpMWkpXRk5QWVhVVm9WREZhMWV6YzFWZ215UzNkTlpITzJRQmhi?=
 =?utf-8?B?NE4zdTlIMGRDcUZzNlJpME5oTkJzdGEvZHVvcHVFVXVsd1g2TFJQOE9RaXdH?=
 =?utf-8?B?anJoQjNySk9UV25tTVlMd1l0bk5MdFlmZGVLdEIzV0dyRytTaXBIdWlnMnQy?=
 =?utf-8?B?eU8zbDBoWWVaVjZLbEdaQ2hwS3JrcVQzR2h4eUlzWG0yWFJhSDAyQ1N4MFNC?=
 =?utf-8?B?OS83ejBZRVJnMktaRTJhUlBCQWNXZlJlTUxZNWh5c0FCeWkwaUUxZ2F5TWtp?=
 =?utf-8?B?U0tyN2xOcGMzMkhuWmZEV0Ewbkw5c3pwd1lxR2pUMm1SK2d6VnFyNWN6S2VS?=
 =?utf-8?B?eHUyVWk2eDk3NlY2UVdRNk94OWRmRkV1UytsT0pKcWpoank5b2FLSFFrUlQv?=
 =?utf-8?B?NUpFSG5mWnQzMG8zcmtqdDdtWVNhaiswQURobmswZTZ2WUZ6QnplWlVNbFpI?=
 =?utf-8?B?TURzYmlnMERmS3QrZWlhZzMrMlNMR3pmKzVJc1daT0dzd2N4OGlSUGt4NGIx?=
 =?utf-8?B?cStnUmFTMlYzaldOTUw1RGRSejR3S2JIRkxqcFBsVzVhVVhVYnEwTXNlRnBn?=
 =?utf-8?B?d05XS21IRG5hYXdtR2lYNEFUR280b1dPaGdJeWM1WVFodEJtdmRHcUJ2c2pY?=
 =?utf-8?B?TEdzbTlQM1N4Wkdpb3Z4Q2NNVzdROHgrU3ZjNU1ObHdnK0h1ODZBbDFtN2Nu?=
 =?utf-8?B?VndiQjRoSzB2SG1nVW9Zc2ZqZm1WYi9EUk1BdDQ2NUw5ZFhndVBkUHk0QWM2?=
 =?utf-8?B?K2pJc0FqNHZBL2xtVGk2cE5sSmNHd2Z3QjNtTG82SU1VRnlwdU1IVjlWYzJS?=
 =?utf-8?B?a0Q4MkFyaG1JRlppTUFCR3puRVlVRUZFaXQ0UFQycFhHVDlpZlNpb3ZBV0lq?=
 =?utf-8?B?ZG94SzRFR1FvanNvSGZBU2xwY2dyVFp4VHc1RTBlQWZja3dWUEowdkhGRzF4?=
 =?utf-8?B?M09CZzNuaFRYQXB1dTg2UkpFRGZYVzc3NWQzMUszelBsUnZ6c0NiZ2JyQzd0?=
 =?utf-8?B?N09mWGRZOHZKTWVYamNLK2RSUlNGUkdKMGc5K3pNWkhaN1pXQlF6aHB5KzMx?=
 =?utf-8?B?anVhR1lLcGR6c0hxbXYzSVljQ2RnS28wSkV1TFZLek5taXlkZG9jalR2b0xF?=
 =?utf-8?Q?IrCb/vraLrNhKSiB5REw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlVBRHFVdU5FaDhrNFUxcXZoZGp3RDVzeTNJS2FBcGJEYmNSanRYWDBxQWMz?=
 =?utf-8?B?ckZzRjltcm9ldU1GTjlVSHdhemRVSmVJeXNmTFNpOW15S2o5Zk5sUHY5Zitx?=
 =?utf-8?B?OHI4RXF1QmJoQkxvMS92UVBnZmtaV010WC9RVlgzWjB6S1h1dzRvSWVKZDN3?=
 =?utf-8?B?K0gxWU83NGIvQjZOSVdPZEc0a2pnSzlRZjlxZ3ArT0pubXJxeWx3aW5tNVln?=
 =?utf-8?B?aEtmZENXREtWeFhFb3RkRGlENVdidmN5WlM5bjYwdHNEa0EvajNLWXhqN3Uw?=
 =?utf-8?B?djI0a3Y3cCsydHAyV29JME1lTUYzc3M1SFVZZ1l0bW1BUVRGK2g3Q0xtZFFN?=
 =?utf-8?B?aWx5NmJWMHJoWkNBblNueGpOVlU5OHFyUGF3Tkt1YU1zYzBzOFplejVraFI3?=
 =?utf-8?B?aVcxdXlhUzFyaUJ2b0dIRS93NjVkaTd0ZUlzUHRrNHZZSEM3ZWhTODBsZGkv?=
 =?utf-8?B?N1NCU2ZPZ3VKSSsxVks0c282dWRsbDZoY2lmNlhPSTlBTHcyb0JkNUVxTnY0?=
 =?utf-8?B?eithbEhkRXJyMFNSLzZEZGFSWXYxb3plVGNEdVhvUjUvUmVKKzdSQkNPK0tZ?=
 =?utf-8?B?MDVNbWxpZVFLNElpaTZkMytlV2ZjdDdwYW9DSTJZdGVjcExodm5Gb3dtZXJl?=
 =?utf-8?B?MFRRdU4zSS9LN1k2enNSbmdYUDVOTzNzZDM0MWdVWE1pbklPdVJPUnBHT0tV?=
 =?utf-8?B?TXZLSzdZcGtoSEZyUW4rSU9WQkMrVkN4QkhXQ3lkaXU0VVlwWGUvNkI2UmJO?=
 =?utf-8?B?bmkyaG1PY0gvejZ1b1pFa0lyb0F2VnhsM3BYd0JSUTlyT21JR3J3cjYyRU55?=
 =?utf-8?B?OFUwM1JYMm0zbFlkbUtYYmFPLzB4dGZDR3lwYzIwS3JsZmF1VWJSWlRtcTl4?=
 =?utf-8?B?SU9waUI0c2tTc3d6K3FCSm5wVkFzSEIvQnY0MnZyb1UxazBybC9TZ21TcDcr?=
 =?utf-8?B?dFpITXI0MjJTd29DWTRRTStwU3d0R3BTMS9JeERSenBmelo2by93U3BJU05k?=
 =?utf-8?B?UnhaRjRvdmY5WXNpVjAzU0NnWHE5NWtRSDhIUmZUakNTOGxqdFJxaWFHcGE1?=
 =?utf-8?B?dTN5QXM5c1MwS0c4M3lsRVArZnBjVStXNjBjRkJqOXBsaHFac3JPanhYemov?=
 =?utf-8?B?R3BSUzBXaUpYbVhPOEp5M2Qxb3NBM3hicURKdW9ZdHZhZnh2eXd1a3Zud0JD?=
 =?utf-8?B?d0lpOFptN2xHdkFQZmFWaVZHcjQ4bDNCVlljbzZDY0lyaW8rWm51eGkzeSts?=
 =?utf-8?B?d2d4NjlVWjY3ZDc0SEFuMWUyb0NyZDZhVE9zUFdNeUcrcDQ0b3UvUXYxZGNz?=
 =?utf-8?B?VDNPdmFHL1Bha2wxRVVBM2loUGNuWlBKeDJENDN1WXpxSlFtZFY2QjRzanFE?=
 =?utf-8?B?M2RIOEQvRG01ZVlZaHpLN3FyL21xRi8xU01Od0xpQ1JtR0RMUzBjMWdWOTIv?=
 =?utf-8?B?M1FKK25lT0h3Q2h5MHlHZzgzMllkM25kMGVJZk91SHNPUml2OHJ5eXE0N0NT?=
 =?utf-8?B?OGNHSDJoSEdMK2t6TkpROG50dGl0QTgzQVgyTGVDa0c2TGY5aVk2cVlDd2c1?=
 =?utf-8?B?bXFOaEdyUTV0eW16RzFvVHk3bUpVL3ovdDdaZmcrbzlUMlN3QUIvZWJUZzVT?=
 =?utf-8?B?YmoxNFdWZisvVk5ER0hpSFNMbloxWVBrZWZoUWgxSHJlZExCUlNLeG1Kd08z?=
 =?utf-8?B?eUFoSDZZR1NFeHVmT2tROHZPcHNiV3RETm96eGJPeE1sK3FaTzZDN25rL0Fo?=
 =?utf-8?B?ZGRYcHMycXhIeGlSVFZicHc5SUNTZzV4M2xyRitXcm5QNHEvbVErdnMyMzls?=
 =?utf-8?B?QStPRElHWC9JRkhKaTNFanVXSHdTSlg2MlZTOWFlL3hXQUJpeU1IMVNSMEN4?=
 =?utf-8?B?SkJxeUxTRzN5TUJ4Q0tCZUFPYTBtVTVQMmRhdUh3Vm1sbHROOUsrSVhhZTg1?=
 =?utf-8?B?SFRUMXdGZm1PbS9kS25CRkN5ajJ5amEzV0ZvK2RQVnY2anBpUjJnSHRJZW5O?=
 =?utf-8?B?d05vSVdqMTRzNjFsSTV1VU1iVmxjcjQrQS91YXpqNGZSRGkzbHFCME5leXJ2?=
 =?utf-8?B?TUNFbVlsN2F4RlArQmlJNHNOYVBaVFBxYjhGZ3RmOVRuYUpsS2ZaQ2dra2tz?=
 =?utf-8?B?SEdUT0YraCtMN1dKMTFHdUQ1NlNkeUVVRnkxa0JkWlIxZ1AzdDFKb3FPcWRy?=
 =?utf-8?Q?RDIQjtEafVm5Xwfbx6SdJUM=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1902d9-da55-4c70-7bd0-08dc863badc4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 15:16:45.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1gKCP0Rha7dLg9c5Z81nVcpJyuKDrhhUU/uvNx2inIS5GPHhm0nGfEiYKK7LhvzKFi1YH2iHH8wwnjoWhC7SSMuuUdr3TA/84DH83kODIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7304
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 15:16:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5279

Hi Jasper,

On 6/6/24 5:04 PM, jasper@fancydomain.eu wrote:
> [You don't often get email from jasper@fancydomain.eu. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Jasper Orschulko <jasper@fancydomain.eu>
> 
> Going through the docs we a new trainee, we noticed that the build
> initialization is only mentioned in the quick build
> (https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html) but not
> in the in-depth getting started documentation.
> 
> While this is repeatedly mentioned later on, e.g. in the "building" section,
> you might easily end up somewhere where this has not been mentioned yet.
> 
> E.g. in our case this was:
> 
> https://docs.yoctoproject.org/dev-manual/layers.html# (which comes right
> after the "setup" chapter)
> ->
> https://docs.yoctoproject.org/dev-manual/layers.html#creating-a-general-layer-using-the-bitbake-layers-script
> (which is linked right at the top)
> 
> To avoid any confusion I think it best to mention this required step
> directly in the "start" document.
> 
> Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

