Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A54C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 10:53:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90716.1783076016662210426
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 03:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fXYKf8f2;
 spf=pass (domain: cherry.de, ip: 52.101.66.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpIfmImUZImOPkfkVUUyvcuAxITLnsHdVGThhuF7eQjKQbZhBjVKB9HLgUJPFm/B0cVheR/Px6o7vbCOE4Zuf9BlyKTXbVlmphdRZvFGOhZTcLBWQ7c5r9yboo7Am7gzhyNW4puoYs46naJZEEihx1HT/ahVdoyLHzS5fcJM/lhUKdL5192KwIhNVBRoyfqUfYdoReJR7bgAfD1dEjjudVyx/9zW+WdaGBJNeotlnPc1393B4KtpHlnXSPyvB3lPecaZ4eZIff1HdgSn7SwOlO9BLgnj18CG4dlysgDKK0VQNCGr+NP9/DLl+yZMm8apXqKdioMjpe780k4RNQseBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1PjWx+t9vtuZoVdVOYmeHaKNUh7Yk3fbrzdezJPrlo=;
 b=Jfp06RDkug/CyqOj1jvP0i66H6LygXv84cXXyaBUR3VxgNtFxoJZqZCwJyvNCo350hKOr4y73pAB8+JKIeBo+TiXwLxMq7TH7g2klBUquU3gPb1bTpQ+y4dzt55vGELiVS3RS+qxpxbWTxGwG+g62+beZjVPj2p1RXqh4NO15QYdPEczZwGE8+4PuEgt+x/gEo80X9BEGE8eOyx8RntpWsixcknPIwZJI0vXHmc8CXYLE8TulYi5KxSMaNJ/C4K6XN7wkBvJZ/WU6xu4bFclae9absJrIl6CXaIEM5KtI2Gt8C416LvYdMmpI4FwJo2Z/prFRM1gMRbyO/N1kk9qng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1PjWx+t9vtuZoVdVOYmeHaKNUh7Yk3fbrzdezJPrlo=;
 b=fXYKf8f2cTUH080iHitamfMSGCf54zLG4rkP2zrWO9s8fkijwJQ8drYKWUuwyUai8oGa9553G636WC/++EN7zoAfT4mc8nzGiLAETHKjjuua0akxXPqt8bQDLZv2/ecX7LbRpawqQ/LVHWsdKmdlC93qh2rLuNCu8q3v4dYclfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 10:53:32 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 10:53:32 +0000
Message-ID: <844af1e4-2c8d-409b-8f84-90a68aa9f23e@cherry.de>
Date: Fri, 3 Jul 2026 12:53:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 3/3] Add a pre-commit hook to check the glossaries
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260702-pre-commit-v1-0-0ebd211b5d5e@bootlin.com>
 <20260702-pre-commit-v1-3-0ebd211b5d5e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260702-pre-commit-v1-3-0ebd211b5d5e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008AE.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::656) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae2c59a-9e19-44e4-0893-08ded8f15300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	chM5tAR22WQvNddYScrBYbrJL7WQ3jUN8oFYVxjAvl6UOgbvvPnlOlGYeT1MAJXyL8uVr4EasJSksP55mHRQzWcsRGlJ3F8ToVU53yZgDE1UnCbsADThVb2MF75NtxhLTmqLCWOYdYHaVb0+Xaosv103Zvm0rs1qFxU4OenudLUBrqqeguhpjkCOautqSDuQOZnU8Q44T8pBuHBQKUTwk9BYKTGlaO9zNed47Whw+XPT3t5kDdAH9garxS2bvVdwiBlX8+7wPVAcPDvM91wue04ggT43ZG32435LJPuxgAJH7KCl9rrl1sAlEjCvfKgNPk7YJyfLT1JXOU7vj6b1dNuRYOLklShM61kBkswm4fccDim91KtYCohrqhi6e80ie6D3kf+fxvMIeGgQwnqyX13kXlE01DaB9wIwQktvTPmaG+bLEPMJ5QmuwFou5Vdf4SwoKhKFRDgfNMGzvFXfx6aqijj1/Kxpg2bEL7Z2YS/5dBr2fWrQcoQv3K1/VDcxAKv1qNTZRX0p/BNlOsRJTAPljLly/lIul47DmEZghbNIQDNCn4Dn8Mqj2RtVUetWQJhGj9XxIyK1CCiWy30ejA82h9Yjk8AE1lAYvGUJi8OrNCRDuHohBTp2YNh6kyP8OjO+LWqfR+GSP9X32zSnrwgttGh6dJejL/c/1SMzifs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THhHZjU3dmtZSHR4YVJKNXYxOS92MDVNTURKVmdTTmoxNGUrK0MzQzlBOUNB?=
 =?utf-8?B?cVBnRG43UjQ0WHNTZmV0aEZ1YWc4K3ozWGMzL2FaZWpEd2tBSm5Cd09BRjgx?=
 =?utf-8?B?WVlWVUdYTVZPZndhd2EzemZvVStwZ2R5cU9lYUQrRkRoZ1RaUWs5QldCamFK?=
 =?utf-8?B?QUtGTitSK25qbnRCSnB2OEF4SU5YcllndEV1Smc4aDJ3dUVCeGF5MGtDbkc3?=
 =?utf-8?B?SDgwZzZiMXo2WHdGUW9UNklrKysrZU1CQVR4dE13Q2pGSnl2eklpWVpBUk90?=
 =?utf-8?B?ajV2VHgrR2xJaHN3R2JtM3JwbGFBVjlYd1FrQldOeEpJVEpWOWpzMkRNYjdh?=
 =?utf-8?B?d1FRTkplcVFoVU5ZTnBIVGFzOENGRTczMjVneURhMHJRenlVQjVSM0hvditZ?=
 =?utf-8?B?UisvcFRpSUlBR2ZFdExHakU0ZmY2eW1xdzFsckw1VERWMUJYYXNpM0ZkNkVs?=
 =?utf-8?B?R3ZrWE5ueVFsWnFqekVaeEFLOTJHYVNsOVc5SUZDQVhyVElvUlNPRHZsUkFM?=
 =?utf-8?B?aFVlckFXVGJvWU9ML21VUWFoVFY3QjNQbDRSbm1PV2x5b1ljVmd3Z2lGN0N4?=
 =?utf-8?B?b3ZoUFJRR1daMlFUTzMzeXlxcEZaQ2plbEFTYkFDNzZoUUZXZTNtSWN5WWxo?=
 =?utf-8?B?bHNlMkxUcGZoeUkxVytFZTR0aitoaGhBVDU4d0tkWXBEWlNuUXV2QUc2VUVY?=
 =?utf-8?B?MU9sMm41ZHRDL2pnZEdtQnJ1L0YyMVBxRVFCQ1YwNGpVYmtXOTBUSlFoR2xi?=
 =?utf-8?B?Ynh5Qmhsd2IvS0RYQ1Z4bWMrRXZvKzA2bU80MWgwWUpEcTkyVzlYUFphR21u?=
 =?utf-8?B?ZVFqU0hPRk9LVFVoNEJWVFB5bVVtUzRTdUY1L1RGQlZOVC8rdWlKMStBdWtS?=
 =?utf-8?B?eE5nbGduNkpXUGNRckd3OUIvcHFjZnNQTk91Z3hZckVRbXY2WlMvRkQzQXhV?=
 =?utf-8?B?K0ZodlZjUGh4aHptVWI5Tk1SLytCWjJBNkdQWDBIWVJQWkFaQzJnTDkrNGpu?=
 =?utf-8?B?cUZXVmpkMjJtUnRZVDFQc1Y4UHhrUytHengvNFpYdlVTcjJOUTBKcE4vN3Uv?=
 =?utf-8?B?OGRGRk5yN09oaGVpbmVENWMwN2lGOVpMM2hMa25FNy9Ualpqd094RTZBcEZn?=
 =?utf-8?B?dmJBM3ZUODI0RlVsY3c4QjJzaWsxVys3RjZUb0pIblNHdGE2cnFLYUFMMkN3?=
 =?utf-8?B?VytTRTdBWGVxcFJnM0wwb2V1dUlEdXVucW14WGk3MHdUck9rYzNZRUVwVHVM?=
 =?utf-8?B?MlB0VjdyaDFSVGgzc3ZTSEd4dEpIdGx1ZEQ2WWZnTXVnUW44WFZUaDM4RFlz?=
 =?utf-8?B?aE5ZZHkzUWtmcC9sT2NMSXZ3ek9LRTI5TlRxS1hjTEh5OWljekgwNDI2RE9K?=
 =?utf-8?B?eG8yd0xpVE5FMitpNjlpWHl5M01lL1l0aDZ2WXpvTkNlRXZVcWpDZ2ZSRS9V?=
 =?utf-8?B?VWVGajlIaUNpUnNJem1rQ0c3alFVeW9yM3pnNTNoZnp6ZGptQWhFSXRvQ3pE?=
 =?utf-8?B?M29iTUVZUzZ1aU4vZ05GN2R6U3BjWVBQMElUMnMvRUtLa0d3THBNZU5WdXJz?=
 =?utf-8?B?MHpNWG9xcDVIWmtieGk3V202UjJRd1AvdGJPTW1RbXB5b2pvUklnMS9xcDhs?=
 =?utf-8?B?am5seDV2ZFhUYU0xK0dqUFNPVC9jQUJ5QjlUd0Y3dGtUWlNTRGI2YkY4dXcv?=
 =?utf-8?B?cFNwSC9GRlFoeGJiUlVOenhGZ2Q3TzM0VTJ0eWxHcWt1SmR2WlJ2dDB5S2F1?=
 =?utf-8?B?NVlnSWwzSGt3M0hoZlM1Z1B3WnJyRDZhaDkrekNwTTRJM3dGbTJvNk1ETExH?=
 =?utf-8?B?RVR6YjZnVUQxMGg4VTFWa2dJU2FMVDMwVVlaRXJ0NnJKdnJxd0UyVWVSWDla?=
 =?utf-8?B?S1UxVzVPT01VWGVtT0dTYW13aVE0ZmMzZnE0WHNnTk9STmwxRjlkV2FEaDdu?=
 =?utf-8?B?NThpQ054R0xRakw5RTBkYzBZQWpqSUgrcFdRaVRKQVlDcitiYXJNemFkNWNr?=
 =?utf-8?B?aFlrd08rbFAzS2piSHo2allCNnF1eUtNbWE1eGh3TVZiMDB0TDZEUTBmMXNU?=
 =?utf-8?B?VlRGV2ZSOTlqcmxrMjhUaUxJZnhmMTVleXE0ZnJqVTBubVQyNUR0OVd3Wmpp?=
 =?utf-8?B?bmVzdmRsVUpiV3c3OEQyZXBKSXJsOGQ2b3NpQmh4VjZMVmlLbCtmSUxWMVdm?=
 =?utf-8?B?RjlwU2VWSzJ6T1lKVTREM0Flb0hTeDRBTDA5YVZEVFpSaXVpcFZTcmsxWWdP?=
 =?utf-8?B?NDNTVzZyOVJITzFqbHNybUgvYS9od25OOUJ1R0hIZk82cXlvWkxDQjV5MzEv?=
 =?utf-8?B?WFl0Sk0vOElXUFRXZXNJYm40MnNnSC9SZkhXZnExWTlqcHIwdzI0Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae2c59a-9e19-44e4-0893-08ded8f15300
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:53:32.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5PYyjdAYXpGTTxpCsh4hdZs6crirEcnSR9wrMKMcgSK7ATYv0G6fNSipB9Y/eCwU5TNSv8CI6UfD3dGWVm9OOytN5HyZsOUyANxq7YXxXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 10:53:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10012

Hi Antonin,

On 7/2/26 3:59 PM, Antonin Godard via lists.yoctoproject.org wrote:
> It is easy to badly order the glossaries or forget to update the list at
> the beginning of the variables.rst file. Add a pre-commit hook that does
> it for us, and update the README to mention to enable it.
> 

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

I think the check-glossaries messages need to be reworded because I had 
to read the script to understand what the messages meant and what I was 
supposed to do to fix them. Will send follow-up patches.

Thanks,
Quentin

