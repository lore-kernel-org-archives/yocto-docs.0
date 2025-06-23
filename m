Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22D0C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 15:31:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.30])
 by mx.groups.io with SMTP id smtpd.web11.1795.1750692672942542269
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 08:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=N4B7axS2;
 spf=pass (domain: cherry.de, ip: 40.107.162.30, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrNIlMdOoIlZSJcdRUDZTFuBDneEr+lWD0urfOXB4cOh3iDtv6m25/f8CoFz83E78YH7rOP+9qARX60tZXJt0y5+K38pK5FZwaseEeol01RGlYi2ihiWsbQOu3wkaAHBNP6a5xhDs3nj9zFMtDsyFcAdjKEWN1HwHmcpZIQCbtATUC63ysJUYEskjTcSsUaZzMm6GzBoJVpKS7J/a27FacSTL1gPfoOmxRYVcArGuOfcWPhUtWVFEpixxDhfOCA+2QQIP5Mb9mTi4sJON03uOKZPtgP9jvQNiTz1QcXxkDWw+b9w3COpZ0gHjvo3tlAAcRPubSUzu18Zx1/TLwUa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiqIDGe4HieNvY87obfrSfxQKgLG2RWrntqT317JUaQ=;
 b=AdYEUxhgVvihDB7YCEaw4sQsWweomqlK7A9YHIKakS5f0ag6Ax9OuVoyzld5M0vuOSDvuscwDyxUibWOxvUUD4H4jqoP01QgQxZu48MOdy8fBmd6PegnqH4yeeVAYBmQylOEJqXiHeI33lz5apgp5Pf5P6P6qUYe8LyO1a6oo1LdY84G+VBk12WdY4+CMxmqzJyDvK8Wl6OCLHVCZFwa7yJZZ0uoh6OEDZoQHEONB1dbVgpY3YvNLc5ERUAXQIde6NME4lWJdi7lRFpcga/ENKZR6ELLUUOCIprj493vVdZLyaJFqqdgJj3qQqOWGBJKuGYDWs4tXydeHgZdGRCJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiqIDGe4HieNvY87obfrSfxQKgLG2RWrntqT317JUaQ=;
 b=N4B7axS2RIhh4O6Fv8puSqc893XUYHQ+WNnZlHcy7WDa0yfq0UbMxY6yOnLQizZgj27NEkadYPyDrTU1tqfeGeG5d0boGukGo7uTBzkloXbcJx4Azz7EOhRoHie4bW/uzTg9t7lV4xy4bFa8NLYbwQvd0mx8G56znOTDAqAua1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 15:31:09 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 15:31:09 +0000
Message-ID: <a6981545-959e-418c-987d-ab8d19dc622e@cherry.de>
Date: Mon, 23 Jun 2025 17:31:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: replace "on the contrary" with "by
 contrast"
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <4214b475-52f5-bbe6-04a7-0dded5906f2f@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4214b475-52f5-bbe6-04a7-0dded5906f2f@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0158.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 551f84f6-e9f5-4510-8352-08ddb26afa1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVY4elpIT2VnbWRabW1jSXJxV2Exa2VTRU1aRHE1YnhVK2lLdXdoaHgzVGpk?=
 =?utf-8?B?aDNrTlBidWNDWm5BZWcvZStXWjN1WjVyQjYyQ0tLTFZBUDU1dDl4ZUJFWmZF?=
 =?utf-8?B?eVA2VUdEM1JPTFBxYUtMT3oySU9QZGVtdUFSNmQvb0lpNk9KZGh1aHNtcUFD?=
 =?utf-8?B?ZWtYcng0L21YWldXNnJyNU92VFFnYmJzNW1ZTU9NWHQrbzl4OXVIa2pBWjN2?=
 =?utf-8?B?WDJwNVJHeTd2ZnQrME9ETXhvSlozMGh4MU5zR2x0djdvNkxrVzNPanBPL0t6?=
 =?utf-8?B?ajBTMzJFQldHZ1BLOTI4QkEvMGNtdVBMVjZDTk8yYUVDdFJ2YnVxM0NXUEd5?=
 =?utf-8?B?K2NUMXdnRC9SVjZaNHViaUNWUjhORzZWUDY4TFhNZG9OMVZqTUl0VlBaYzVV?=
 =?utf-8?B?R3paSjBsTGlJRFlZd21CbDlMNjBpOUN0cDB4azEydnN1UlRRcmFKNU5ETkp5?=
 =?utf-8?B?NFZLcjFNRGE1ZEpvb3BndG9LaS9aSndiRWd0RnZua3NCUnEzdE1XYjc5NEha?=
 =?utf-8?B?alVDN1dKbkhzdDhZRHB1Y05lYnpkUzlYeldaYlB6SThZd0FObFc1MWc5RTB3?=
 =?utf-8?B?RzdoMEpGK3F0RktvVWsyZnRyZEZXVzlWc2dCazVFNCs1MmZsT0tCbHN6TWpE?=
 =?utf-8?B?WGFpazJEQU1RcE9jQ3VuVVpPTzVvV3Q2KzNzSnpzUThDWWxaSWdVSUFVbjZP?=
 =?utf-8?B?eXRqYkxyb0dUMGxraWMzUkpTc0NLMzBxMWp3aDBsamJWQ1BQQXBaU296TTl3?=
 =?utf-8?B?djFTaDhZdnNqcFQwdUR0clU3ai9oNDcvNkZvZ2ZwQWd6dTdMWHFlM1B0MSs2?=
 =?utf-8?B?WU96MHZpU21BenZNejBxU1hzVjZ4WEtPZ01PZkFjd2t1cldsbVBjQWJyUmow?=
 =?utf-8?B?T3lIUS9rZW8yaG5VR295R3ZjSjFJYVFzckFWQVJzV08zWklmOXpUQnFLVFF0?=
 =?utf-8?B?SFlRQm9nY1k1dHpjY2xiYm1jN1RPM20xcS9tMnZtNHAxZ2FMYXNITkhtYVk3?=
 =?utf-8?B?L29FdGhXZGhodm5hT1hqN3JRd2ZTWnRqeXlyOEtDTkY1MjNqYnVaQWJtQ2gz?=
 =?utf-8?B?S1NtNm96TTZ1aE5xL3ZQcW83TFlyREM0NFVCNWpEdFNheEcwY25GZWRrS0FT?=
 =?utf-8?B?STdMMGhFTlhacklmVUhqbzhKODQ3VnBmTm5mU0JwWXYzTHZnUUMxZ2hpV2o5?=
 =?utf-8?B?cHFkQVBNeU1FVW16WVdQMmZWQVEzSk1wZkUrM2hxNjdsa0tuTGsyaUJYM0FP?=
 =?utf-8?B?eFlLNmE2UUdjQ3BQRFJ5MmtWSjZpdFhOanRua25QSFRoWmJlUTVKTmVVS3kx?=
 =?utf-8?B?TDU4SVhwSGUzYXREVWJuM0dtUEdKeTVUdmt5SGgxTE1kcVpaN1pBZXp3bVI1?=
 =?utf-8?B?Zmw0NndrcW5haFhINlp5S2JMVHVqd3NYcDkrVmU5Vyt4MC91MUlnemNmRklk?=
 =?utf-8?B?dWVKQmtVRCtIU3oyT3hiZVkxNzQwZE9ZL0tyaFdmU25BRU55end4RUhEemR3?=
 =?utf-8?B?bFMvMlN4eVhwQnZRNlUyQTVzSCtyNEFuYStCWTRDSXBPSkF4L3FXTEtBVlhL?=
 =?utf-8?B?bDA5b0JBbFdSM2RyNStCRUl4NmxZcnhjR3BsYzRQcjEzc0FtSTVlS0FCQnM1?=
 =?utf-8?B?WkttbTVvREtSN0RnbDk2dUhvSENiOFM1cXdRaTVxTHJZMG9XbmxCRGc0SHJ6?=
 =?utf-8?B?ZzFBUDdZdTVnanRpMm0wU2pXaG9uNUxnZFJubzBlMTJ3VkY5Y3hFMWRlYzRU?=
 =?utf-8?B?Qm8vZ1hGVEJ1MUJSRk1HR3VtZEJXRWRkTEpITThqMjB4Z09pOEQ4NUFZemJY?=
 =?utf-8?B?SDdXL09YQk9zdjlNVWVIcGNmeWdVQ2Y1a3BqQkVEZkV3THFTZjFDRkdWVUZV?=
 =?utf-8?B?S294djV3eWtVc2hjV3FJV1B4WGhwV0ozV08zbWZuejRmOWp1K0VQQ0RFbDVG?=
 =?utf-8?Q?iIQNYXIc49Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnM5UnRQRllESWNFMXdGOXdoQ01sREZDdjBlK2d3S3lveDdsYXNtOGRmNC9a?=
 =?utf-8?B?dE9nUHBydXhRQzlBTVVTTit2T05tOW5lL1NoejdaZUtwMXZ2VE9WSndVeUtF?=
 =?utf-8?B?ejhndnR3dHRuVDVHWElXa29mTVpScDcyVDlKMWNXZWQ5Mi93Q1RSYy81M3NU?=
 =?utf-8?B?WXJKeWp4ejg3S29JWW5ReGZocmlQRE10QmxLZ3dyd3Fud0d2WmFqM1RLWlJl?=
 =?utf-8?B?R1hGSnlFQkIxUXZta2plQ2xITTQ4NlMxNjhFelFReDM1cENGdzlnUW91MFNQ?=
 =?utf-8?B?bDEvRzNscjBUL1V2TmkxQTJXenZWQXEyRE5ZTW9WOFRCSEFKT090M2VSbWFk?=
 =?utf-8?B?Nk5WY2RmVnpFL3EyaXpRSTZQUlM5WllXdDZGa1c4N1A1QmpRMSt2Zjd5bldH?=
 =?utf-8?B?cjBzcTBsU2VGUmM3RUc1WFdJWlVjYVhkVkkzR2Q4WG0rMTZTb01QYlVIMTVh?=
 =?utf-8?B?VlJ0ZGpOSHM1MEF1ZFNoNnNZVGhKZ0kvVTlWR093NnlQM1MrMnV4YTNka3NH?=
 =?utf-8?B?U2d5QVY3REFPejVVeitLQlhyNWdjT1U1bGUxZWt1OWtHRlJ6T1RMUWJRRUxa?=
 =?utf-8?B?bC9XN0lIUVl1Wkx4Z2loU3llT1cyM3JLSTlVaXhXanBxTjBQWGlxalVBZFZk?=
 =?utf-8?B?bDlRUEs1bnJaR1NHZlI5TTFOMml5NUh6QTZteElNMjZNdHNab0c0WmNSL1h2?=
 =?utf-8?B?L3BsblFqUi92OXVpUDV5Q1d1S0o2bDBHSkI4SC9WZ1QyN1NuaDJETEs3NUFk?=
 =?utf-8?B?NHBaK0huMC9KZ2l6QnNPaGl5b1hDang1RGt0SXpTb01Hck9qKy8zWkRBb2h6?=
 =?utf-8?B?SlB4Q3dTL2VqbytqMHA1Ujh5YzNkTm1oSWlUTjlvTVpSSFdpbzZMd0tzbEZS?=
 =?utf-8?B?eXNqM2JJUWhQOUxCMFhEK0MrRG5Xa2JnYzB3NFRPQVNlQ0d6eHNhNEZhSDJt?=
 =?utf-8?B?ZXllTzVLMWpIaENWZm9OYUtWQ2VkNDZDWGZ3QnFYMGI5bnNDSVVML2xsc0VU?=
 =?utf-8?B?U0xMSTFZME9UOGRvTlMzRUR1VW9Xcmx4ZWtzWUIyS2Vjdis3WGFpZitKREV6?=
 =?utf-8?B?YktJc0VMckJHOUpJbXlGZDNTakwrenpUUDV5VFhOZlQ3dVRvVXF3T0tUWjdi?=
 =?utf-8?B?d1VaVUJzODN3RGhrR3N4T21CZFB1cVRXK1VXWFJveldVMFlMV1IzUzNzT2xo?=
 =?utf-8?B?RkdnU1Z6Ty9EeGF6STN4d1ZlTEloekg0dFJIb0NRckpqRUU4eVIzYVVyL2wy?=
 =?utf-8?B?bkE2V3RXK0ZLR0tKeUdNS09jaFZEbFY1KytrQUp4L2dXMWNsdXlUTXFxKzYw?=
 =?utf-8?B?N3ZUQmpBN2sxUzF3T1RlSmlTYnBrbDMrdW5YNzd0UlZQWTVoekw4TW5IaHE1?=
 =?utf-8?B?cnZHcU9ZQmZ0MmlOdDRxUC94bmVxYmhNdk5JQWdGL0Y4WjRoQlZaT3NmZzcy?=
 =?utf-8?B?VTMzVEYxY2JzVTREeUs1UmNkR0JDb080WHpMNE1jeDYvZnJYcHNFdW9kNGU3?=
 =?utf-8?B?SzN4SmRLSXI3NHpLNnBQc3l4OE5lQmg2Tjh6dHVUY3hqOGhwRkdLM0lsTjhT?=
 =?utf-8?B?VElONENFR2lVNXZ1K215YzMxWllaT1g4QWp5T1FORGVvc0RaNzdDTHZRMEkv?=
 =?utf-8?B?Qm0vcVB1WFlodGhMV09kWFZPT1lsRWt1NlZqbG9rZWt0RmZMSXo2Vmw0MmNR?=
 =?utf-8?B?aHkxMEZSOVRFQjYrWVpzTklBU3ZoOUpuSStWMVBOZVVzaXdrdEpRME01MVE0?=
 =?utf-8?B?Vm9FZDFZUjVCcEIvN29QbjVSZk9kOWpMcE1HK3A0UXZtYTBnclFkR2FpQWpJ?=
 =?utf-8?B?YWtBMGhFV3RrOHRXb2twMXZwNDhNaFlYQklkM3JwdFhLZStZSzYzK2hOc0s1?=
 =?utf-8?B?dmVZN3JlK1NEcy9KNEhvOG9QQkFncGtsV0xGekdqLzIzU3dtUUZybG5CRFpm?=
 =?utf-8?B?Q0hueTB5VS9JU2M3SDVDMERnUjl0aEhFTGhYd3hKak45cXNoWnlUZHFJYkRH?=
 =?utf-8?B?aE5ZYmpmV2YxZ1RWcjNGRjk1RU1HbE1CWUkrQVo2TUVZTlhsc0dZOVFIaTQ3?=
 =?utf-8?B?T3gxMnBxblBtK3NIdHlVbFk2anhkWTZOSUpDSXU0MGNsSWxrZ2F3Vk1yMmVN?=
 =?utf-8?B?a0ROTUo4MjhHNHlDd2U2Z2Z4NGgvcmYwLzUzQzZpTG82VlFBRHYrSlA1OVRZ?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 551f84f6-e9f5-4510-8352-08ddb26afa1d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:31:09.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +w8uN6yrSd1dZYuWC6YiCDw2JFJ4FvsenEgm9MHE9AEfagciemAQ5sLxgm/NX2z302CLL1hItUvR8i9GeHQrBZF/tx+N3mSDtaF5qvps3ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 15:31:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7167

Hi Robert,

On 6/23/25 5:27 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> The qualifier "By contrast" is more appropriate here, since that
> phrase is used to introduce a point that is strikingly different from
> what was just discussed, that being the substantial systemd.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

