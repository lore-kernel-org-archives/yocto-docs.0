Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F471CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:40:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46274.1778492447092210134
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 02:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YAxFuAPy;
 spf=pass (domain: cherry.de, ip: 40.107.159.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoAS5GlnRPxnhlfkPy0/3+jFBR+7mPR6vuOp9oEBl1yWUxH95Jul5fCVoUXqbKFz3oKnhP0Yfsi80muY10t4j+SnazO9omM0r3kN5xh30MEcd1BkvPQ9hKNUA27L1Dd8h8KSdOFO1WvOGjhXenLJXK62ukuwTw1LxBjlgfkjKRcJCTnBoRvgVchB9tdL2t18gA4XsMVW+aNZ1d3tYgfyQ+3UybMYd0DkqFokpgRRv1rFP8Ek03JAeMWtZR6smyC+Tm0u29IJGDr2bqz00+vnl1tDA6r/QQkUWegv+ry9BaTh0x8neyAXsTTUpI389ik6v+aWCGuLIBW4x88ijJyI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0HMAHkGWEc824spp5xkbDbCUu+Tcmz/Qda1OKAYz9Q=;
 b=BaMcb1Al89g3VRWP84e1wM0la/vDQ4LqZgyMqc2MU/apyd1BEzHVrweyai+P52a3WHCeKJjbMW8W4KpN8vzb1Wg/GeW6pHjrJOVBUsV7LY799RXJHlJjqq8u4QHz/MO95/yaBgC+SFOSRuiZpPHGwg8jbEuJQDo3CmYqQHsLyCOEAIDlSL0QfhmZwY1EmsBo8GHpsQG2ZQiGNXZQ7jnvQfhq/IU3YO8375CqoHIkVljEsraru3LHU4S4GUfdG9O4G0p2nXHUlJPVLN3mabNnzDUubj2hlsLQB6lNUTnhl5BUFSFJpXX5hirf90hifEapwmRDwUDppYjIn8nsHrWySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0HMAHkGWEc824spp5xkbDbCUu+Tcmz/Qda1OKAYz9Q=;
 b=YAxFuAPybkVDcybKPoynCxXeqE9MpBtzTFwSncT4ZEBGAR+agXchIT2vhSvtIj9y5/XCfI44EraPNpFoFKJZP6ljOKMbkHjGuVBSNTwta80oYKmqjsGoDm0nEFlSiBeFrpKjG9LKmhCpjo2fbHlFnnMwinpiYoHncRDOHPGO9ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:40:42 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:40:41 +0000
Message-ID: <d09899b1-6773-4b29-84a3-d9782b0f16a9@cherry.de>
Date: Mon, 11 May 2026 11:40:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] YP Quick Build: delete extraneous periods in list
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <f64194a3-9050-eb01-9f41-64b20b33019e@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f64194a3-9050-eb01-9f41-64b20b33019e@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a33959-136f-4f03-4773-08deaf415db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	oOFq21bcttZXlv0e5TbVV0GtvSB5yy1lT3Mn2Uji4shsMorcXc8KtLpBowqdnDzmnm6HN6F/AWLHI1NRJtzlMipu3nSoA67oj+O+9R8IiqH5LKQZDacO/4WHKnIFVn1PsMnNzGLTgvssFGd6Nv7tcCimU7ikCjFWdHvc2Bqun96H07VIvQrBarVBV8Ca27qm84SGEXFR3sWrjOrUf3/R+7NClMpr7taI4bYLqAI4kwWCm8Q33ub2JNCOQfxgpH3I9DU0oPT7uwcm641fBE32wbXB6bXzwYJxHkC4xdbCk7OWAZdTIJ4p5CfnH0B2QQD6IjBTdMKr6Hm+VtTNIYg22zl+A0Wo0/OlKWrLP4pNSTluj1LgJDiKrnlJvqj/j/ivL51sPQuNWM/cxevaqipRt5uMe6RNMdu9IFME+ZasUj6Oaq/WnCeIsnGpNH2T57wWRtH6bYVL6j6rNP7ecyzmlJGpXJI0rjWXMszRq/BY5DWYFv7vNOXXKgyHDDMqE2VMN+vXTtncJvSajDOA0xEmJpTQerjqkyj/H6mcoq4pzvxFx6g7TwJjUioEo53Ig4vGOfJD3FMihbKlpOAmLTpXdAsjZJHQQyWixX3FPtZ0gQiw3KP9CQ1N1q2OG1CHQtwH7YkcEB5BfIfxGCCn26Rwo2MWuhZpX8T5K/xkd6YwRuYZU/DR5eter/LCY0XtzGe+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emUvSTNocEp1dXpXaXp6Y2h1Rko2TjRDYXloNkw2WWhwRGU5WDNLMHVhc3Ey?=
 =?utf-8?B?RHNVYVhSTkR3Q256WHowbkk0KzR4Wk9FQXBHelVzMy9nVzd6Tk90TEV1MlhX?=
 =?utf-8?B?ZnpINnVnaTJCNmVMQ25sT0YzUDdCRjM5MmY5SCtSRStvVFhPYW5NVkRvbGFw?=
 =?utf-8?B?TGMyYi9YR1JTanBWamJSZk83V0J3K3cwMTVHSEVlVHJXTTEyWnR2dkZPMU9n?=
 =?utf-8?B?aWZTZmkxUlNQMnRSN1p0WitKa3JyQlhUSUs0Q3FBV0dUanBVajQ2RVpSSUtV?=
 =?utf-8?B?NTZraHRsN3VqMnF2VmMwbElyZ0kwakxwT3N5anNjY3pZVHRwVXdmNCt3YzM5?=
 =?utf-8?B?aDBGbnNUSHFITmtqZUFQMjhxYXBaeGZrY0tCa0pxL3pmSjlPZDNFMmpIQXB2?=
 =?utf-8?B?QkZVa3J6VW92c1h6QmZ0OURjV1BOaGZaMEN0a2wrVHZRWHlZcDNNbFBldVBH?=
 =?utf-8?B?K2ZLUjFicHQ2cHlaeHh4VXVtamtUYVY4YnpGVnQ3RWtzQ0NjcDBKTjV2Rjl5?=
 =?utf-8?B?ZHQ1RUNsa0FmVFMzTHMyd01YY1VPc1ZRbWVmLzRNVi9VQkhMZkdCOXczS3Q2?=
 =?utf-8?B?M05YbVd3L2xwa2h2WkMvNG5lNTJqVXFNOWNLVVRua1JMVEJlMW5UTVpIMjRC?=
 =?utf-8?B?eEdJeGIySXlENTFyOFRCdUdCNEp3N0R5MUN6QVl4d0NhbGtjOXZVYkhuc2xx?=
 =?utf-8?B?anNEUTBLUEdmaHdHWTlpNG9RbllReitqR1ZiWTJVSThLSE90cit2alZmYkNm?=
 =?utf-8?B?MUR6TGNqc2ptQ1Rpbzd3RldZUVpzMmhoS2VhTjl5dU5GS1YrQ3hiNks0VzNR?=
 =?utf-8?B?Z0RjeFhMdjJYV1ZIZlVtZU5zdmpnY0NwL1lWVjMzOGFGdjNpMUNML3RTblh3?=
 =?utf-8?B?VXA2eVBIK0dDY3NQR1JaUEp4K2RQS3NKUGxsbEVBRklod05LcHlkMlZQYldM?=
 =?utf-8?B?bEtyWk5PTUc1aU1la2dodUFwQ2tFRjI3dDlNOHhTb21QazdVMENBRXZ3dkJ1?=
 =?utf-8?B?SzRGOXRVRGVsdHJuUXVFYjFLVzJKL24rdHovcEN1NVAyaHN5VVJZNUtjNmhh?=
 =?utf-8?B?Qll4SmFRTG1nTlgzdE95emtGcjJmR2NUWFVvQjd2czZlZ3pQbUNGMWNKc1hJ?=
 =?utf-8?B?RE1NU0JPeGcrbjIvajlNdFJRbFdqVG9TdUhIS25WTmNaQW5NU2pYZ1ExekNi?=
 =?utf-8?B?YTlFUHZtL25PY2hyU3BBV3M1azNPV1Z3dkwxYmc3R0JycjJOSWU4UFRUN0hR?=
 =?utf-8?B?S0JGZXRBOUV3bTlmSFk5dGtKdnhJazNRYnhrS0c4K2xISmh3TmZwRlR2d3dt?=
 =?utf-8?B?djVSU0ZaWjcxdkV2OEtkZWNjRXVRb0RxOVpXdEN5allUN2hhSk5sbEl1QkNq?=
 =?utf-8?B?ckV0Q0FZckZWdDhGS1FTU3d4RE5HdDNYVzgwRkdGVUp3cXZLaFFLMW9zY0R5?=
 =?utf-8?B?VVZIeW5ybzRvTVNIZlNwUGVJaWw1NTBYbUVLdnE0My9CaEhiWDFxZ0RHakF1?=
 =?utf-8?B?Wk1pYk9INHVrdDk2WUo0aUNNUWpqb21NLzRpaVhiUmJXd1FyQU4xOXl4YW40?=
 =?utf-8?B?ZVJldkxzN3VqcXNDVHY0RU9uQTYrcVlDdVgvTjMrM0cxcXJNa1F6NHlqNDZo?=
 =?utf-8?B?SG0vcTd0c1pJV1QvUStHaERjUmVodmgzcUVMeVZFb1RUU2U4RnUzY05IcG9D?=
 =?utf-8?B?amk3QW5tZkdCcXVsaFJieWlKM05uR3JCcmVpa3FsWDZrbTVlQU9nTFFqbUJm?=
 =?utf-8?B?K256bXNnbjlZMHRlY2ZuaVdrM2IvUms5ZnRGaE91T0laazRRbVV0VHFib2RC?=
 =?utf-8?B?Q2tBRUkxbnRESGlXRnc5ckVTY2JiZnJUbm1Fa3h6aEp1SjRxYXF4UUw0aXJC?=
 =?utf-8?B?TTdibDJtaGdJb1F0NTc5djZvZllKQlZMVUw5T0tYb25HaC8rb3VjbjYxZzZp?=
 =?utf-8?B?TytnT2xGVzFnOS9HNjRtY011VFJqcUpqUytFZlJUMFI3YVA2SHh5RDZvcm9V?=
 =?utf-8?B?aHpqRngrNFAwRmNmMUluRElTVitNQ0k5aXh3MVNmdEk3cDZZSTdzaE5DcExp?=
 =?utf-8?B?dGV6Q0R1aGx6QUlsdVFXOG5ycHdMSXBURHVQWVIxRVBMYzAwa2J5K3hHMGdH?=
 =?utf-8?B?dkxLa00wcU5GZTlhNDhmdHBscEJOTW1aY213MW9BVFo3UUZiWU9nUU8zeUlv?=
 =?utf-8?B?cXdrSC9VYk55RFdHYXdjZkJWVjFtMzRmY0JWR2dJSWs5a0c0MDNxZmpndW1q?=
 =?utf-8?B?TDNYdjROOUM3R0txY05ES1k0UFFOTjZOcXV6MktyZGlHZ3ErRjNSVi9wUGow?=
 =?utf-8?B?RnlieFpjWjdjclBTNktzdUJJc1YzSXhFZ0RkRVNtSWkrOWZObGEvUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a33959-136f-4f03-4773-08deaf415db2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:40:41.6144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/MIcV0ZH436KAUSOguKfBm9Om38s8ljOB6/lOUrAh8WPRtNjJoDqls263jP0t4ePYxu0QkYM8rZ4cR2cjhyiL9/I2yLK7c5e47X5hSPc7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 09:40:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9438

Hi Robert,

Please try to stay consistent with regard to commit title naming with 
commits that are already merged. Here a more appropriate title could 
have been:

brief-yoctoprojectqs: delete extraneous periods in list

or

brief-yoctoprojectqs/index.rst: delete extraneous periods in list

On 5/8/26 9:05 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Delete inconsistent periods in software versions list so it doesn't
> look weird.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

