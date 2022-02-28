Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37024C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 09:07:40 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.74])
 by mx.groups.io with SMTP id smtpd.web11.18063.1646039258488634058
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 01:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=KCmE1Ter;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.4.74,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPmuFklnTaBeYP3vu2BmbQF4znBlVgXQ3M2cNO7PpbLN4aRFt5PQizrKXaubmi4G/i2aOw5kljCZUp7jHqTiWozxXTZx5c4NWscsU64+41TlLct/xkeZXoLp7QfA5DSSUDIkQkmTrybQzy/5eoqWc7oWTUZpPiMqyDYDnxTpspYk7uOTnxrw9nR0NHg6x4Yjzh3wOnpAYEbfhB8hoYi38Et2vABYnWWRSwezRwYSpMx2juTsWLib91K7U12s1OmeWV05zrBbqMwKbFfwnVuHDt+NP+EQnZGeKzE/RVVHLrxtd0Zd7XQY7bs/yMK7n3YoZinfqpl3bXw2ueVv1EiiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNH2y4ckiyEjIzdV5FUioiG6sQUVmfJcvMygHtqa5mM=;
 b=B5MHr4mnYh6n4XyUDRrAAx6MVJ7klhdsWixVj1GWE/xVnJJsN5NQ5+2u5x7L+mRgax6tzLs4C5oRn5X7H6EuCn5pTz77OK4P+T6AI/Ws1lQERoCZ0uTt5KBcQm0RFUlV0Xl/JjEM0qt+IVDtLsjuMLFUoghhpQ+iZPtlaGcwEzre6u+iktvqW5TXbDNtyizmSJmCTVhmopUUv79t9tNTjOyxUevrvCKNMKlTzZEQww68Rcg7B1XTSlZ5CAHo6RI+J3S6o3SGSVHSKlmASN3biZjnB1WUdMT/aEgM+V1kL529Trd7pnqubB+k2ZKDmTzO2evUhCPTC6M34J8nwJe8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNH2y4ckiyEjIzdV5FUioiG6sQUVmfJcvMygHtqa5mM=;
 b=KCmE1TertM+gJ7Ye2/41zBo+isUYgclvS+jsUSN8WQLk5hroKSaWlarUhSZIo22wAsicalgILcGG9hhkV8n7+ER630yg9BkqXt8w3uzM1ptTIv4HKkM2dwTNUinvlPqGvsqcJv5nVFwhXMyHsnZRFKmm+l8lhv6f6QAMzkfxN3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by VI1PR04MB6926.eurprd04.prod.outlook.com (2603:10a6:803:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 09:07:34 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%7]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 09:07:33 +0000
Message-ID: <cfd0e149-5c17-e5e2-d11a-aec4c1b53a8d@theobroma-systems.com>
Date: Mon, 28 Feb 2022 10:07:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [RFC,WIP] removal of distutils* from docs
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: 
 <CANx9H-Bpvn-_bVqZkgkNGcwWEFZ3cY+B_Ex4MDpjU_cPt-G9GQ@mail.gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <CANx9H-Bpvn-_bVqZkgkNGcwWEFZ3cY+B_Ex4MDpjU_cPt-G9GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0055.eurprd07.prod.outlook.com
 (2603:10a6:203:2::17) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9ce3262-d170-4ef9-c746-08d9fa99c172
X-MS-TrafficTypeDiagnostic: VI1PR04MB6926:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR04MB6926FDAB1294D7F0CEA8C781C2019@VI1PR04MB6926.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FlyCBNXHFdRAn2pFqDBd1Bstvx8zzxDkjm+uyE6P4Rk2xNLvI3ZcQdB5+mDZBF176otB6N2I1GSkybTs+PKxRJJV4xJhwddsi+12NnSkrYEEswAVTzYGZhQRfHC3mvy9LMh4985wvk6N4/gBfd75q1lGAZyxfT71+IfnAzUXf2pBIyFy4nI4fpT4luXzL4oMxJYc06rl+Qd8ZxBw/R+7FEObJnIyPI5I/TDhcNXj6L6LEMw70YUB9lFH5ctfrWlYqcumd6+JsNKZNt2TGmVa3chiTfxabk0g1w/WoUj+EPwRxWRWMmGkqkszEN5v8+OwmGMwAeUXQ43FE5AKN9sxRTvpHsLCQc19GQ6zOEdHl4AFssfwUf4DYXGILdMuvSugNySSxiK8epaAoL0b2/Wirsdex6E++hgePaa42aw9nj3FjFv3agcDJwdIItQQ+2mITyW0ejF1KOK92bZJC0r1s8KkqwY26WMQbqHvvlqKuBG7Gjg9ddV/Wrv7fzaUYeEllH6frrcX7bnGOyuWRPXcqAtvu6sAUYBsgXiZlo3zGRoRw3l+UCwcJ+VhEaYPQZNc9KSdAiouljIDYIr7G8Pqyc/j8zXpIF+XrBOzmph8Ypf7zPFisfEpXQWgAJsACRW+KcHDnwo0ajyWoh9omgFEU0TudUxFz0ZUtnezr2un3VEPVL33UwHtlwjUoSWHC4Cg83IAUa2BMX92vfIIKsjQT8I4QQk+HDKjqpsH6AMW90k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(8936002)(53546011)(66476007)(86362001)(66556008)(8676002)(6512007)(36756003)(31696002)(66946007)(26005)(186003)(6486002)(44832011)(2616005)(2906002)(38100700002)(5660300002)(316002)(110136005)(508600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDhJS3NQR3lXOVZXRk9Td2xNRE92ejhMMjQ1ZG1ITlZwcUs1dUQ0RTU3Q3ly?=
 =?utf-8?B?WWZ4ZEt3UEM0V0d1RlFRREhySHIzc0pQSFlhVUt0dTArYmExWlJhQ0pJM3dY?=
 =?utf-8?B?UkNEZUpWdEhDQml4Y0ZsbU9oZitQeU9kYmgrVkNDUCt6ck5YZ3c4YkZvaXFv?=
 =?utf-8?B?aGt0b2cvUzNxS1M0WVg4NjJaT3hrVkFPVHFuc0IvZFpGWFhENWFZM3NLOXIr?=
 =?utf-8?B?dXlVOUQvWVZ2RHQwS1cxeGdaZEhrMXg5SVVtY0dUanB4cGY1S1puNjRVd2xH?=
 =?utf-8?B?L202bVIvVG1STFdxMjlYT2VTdXQvSWUwZlBERENRMnMyL21Xc0lYbjN2WlFF?=
 =?utf-8?B?Q3lOd3dNSVR5QUp6blZmZzNvOU81M1RlNUcrYmpieTBxdEtkME5PcmU4SGZC?=
 =?utf-8?B?VkVzSW5vTCt1S0Z4dEFhNXhTVDVPbk5PdVJtUzZ1REFiWWR3QUdzVHFReW1l?=
 =?utf-8?B?bW9LMktkcVNjbXR0YkdvNG9mYXdLY0N1QXcvQWVUbmp4NTFOcWZyZmFQT0dV?=
 =?utf-8?B?M0ZzYlpUK0F1SG1MTEhzVUM0dW1zNGRjMXp6RnhrQml5Uk55ZUFMcDI2Wk9x?=
 =?utf-8?B?cjI2NGhuVFV6VG5OaVd3Mzl5UXlMdTJsRXNHN0xad0NxVEJkWWdsZCtpN0RU?=
 =?utf-8?B?OTMzTno0U1ZBS2M1QUZKK050QW12YnowdzRLMW9lVFl4WWhtVU1JQmdaU0RR?=
 =?utf-8?B?UlRIMnpWd3hZa3JwRHdDOXZSNlJJTnpDYjBEZS9XUWoyYWllNzhvLzk4VVBJ?=
 =?utf-8?B?RHl2cmtXMm1BYlgwOGR1dXNyQllMaUVnRFo0c3E3RjZVWHhxUzd1UEZnZUJr?=
 =?utf-8?B?ejQyb29TQ3dlYTg5dDdrTExpTnFuYlNpZGZRNjFZY3VHYTNqSXNyQlFGZ3ZF?=
 =?utf-8?B?SWw0dEtFcVVzOFNMQmV3c1E5TVpIRXREZFB1QnZNZTRaRStNRkJhdHVNalJY?=
 =?utf-8?B?OXlXczNadHozaEJsZUNqTVd1cWpmVThsRHlEeFZzMWxSZlllTnFvb3dXbVBq?=
 =?utf-8?B?V0hUODU0V2lZaE9nTldaZTJCZmMzVk5UVzZRcHBya3lla1RYR3lsbisrKzJi?=
 =?utf-8?B?VytHZHp1VTZLTU11TVMvTEdXYVRPQlZNbjhjZ2ZZUVlYQTVXR3NGU050K2lD?=
 =?utf-8?B?bFNJSXBhQk11Ymo0NE91REFnc2xiK1VtQkdiRUlBaUhFU0dsVjluT3B4S3R5?=
 =?utf-8?B?UHNUQlJYRU91cHJraG5rQ21wWU51K0dVc3dsZ3NtT1VOQ2I4Q1VxalhyaGds?=
 =?utf-8?B?d1ZRbVdVRC9pSWt4azlTNWxVTzdwbFJUeitlT2VUekw2NDFqWEdhZGdZTVp2?=
 =?utf-8?B?b0FiODNDOVBaVmVqTnllb0VTZkJndm9IckRObml2dEhrMVMxaDhZTk1PZnlo?=
 =?utf-8?B?SlhJWHFsTjg0TjBTZitBcERtOU1SYUZiN0k2Q2F6L1lGWXBkaTZabVM3VTRO?=
 =?utf-8?B?c2tRaWN2ank1RjNrMU1pMWJiSmh0dmxHZWFIWjVyMmR5WjVuRXRJRUVsUk9y?=
 =?utf-8?B?L0Y3aW84YUREZGY0K25FcUE0bGl6aUtHckY2MzFLTUUrY3d3T2lCY3ZwZTh6?=
 =?utf-8?B?aXJkWWFkMjlxODBic2tBUFFXUWgrdUFqQWlobk84Ykp2YlN0a2NHUGxFNFl6?=
 =?utf-8?B?ZXJPOGJudEJFS09SR1hWTXUyN1pBc08zMU9xbUZsQ3lJM3dmYWcvbFZMekhG?=
 =?utf-8?B?QUx0V2tUZmpFRXJIQjBhbTFlcTk0MUZiOG40a3JnSzZ0V3Zod2FDMXRnOGZa?=
 =?utf-8?B?aWllaW45Q0NvOXhTZFU1TFhRTGhsUGk3ejBjSGkvSjh1RnJnN2Y1L3NRa0I4?=
 =?utf-8?B?aVJwLzNrazJkVjNRemZGclV6QXBmTnRsTEg5WGR4MTd1ZWdBZEdOZUVnV3lk?=
 =?utf-8?B?T3hyVHhrK2h1Y2JVckR3aFhOTkFJb2cyT1RCTWFKOW5WajRTQWpjMVZwc2tj?=
 =?utf-8?B?dnozS081NzU3YmlQWnl2RHhYOHdtcUhWeXYwZjJVN2Fmb3c2RGlVUmM5ZTR6?=
 =?utf-8?B?MFhDbXNJd2RTSWZsTVpkN1NVNUNrNC8zenY3QUtNcEFSa1BTSmpLRGJkZUdY?=
 =?utf-8?B?UnphTFV5eitEb0Q5U1VFbkJodEdmT2p0WGtkb2tobjRVR0t4VGpBeDlTQmg2?=
 =?utf-8?B?ZjVqYWFkbXpBQUpOcHd2d29Yd2RwVWpOcG9ZOHFLMGdxRmptaWJkVWZQNGZs?=
 =?utf-8?B?MXZpUnErb09FVUFRc3VPTlNlUDk4eHV0R2hEamtiMEd6c044TTVENUZNeldz?=
 =?utf-8?B?YzFROEFIQnl5RVNYN3lSdFpZVHJJMmZvREk5dmhwclBFUks0bVZiV3hUN05P?=
 =?utf-8?B?b3lGMTA0YVZKWSt3ZkprUkkrc2VOYVVqZFNzaTN3d2xCa0dqKytOQT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a9ce3262-d170-4ef9-c746-08d9fa99c172
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 09:07:33.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Su563Oy6rCQV2E+GdAl4rS4jjUGuX7HTBThHQNm8PzAOqSKq8O5kAZrN9Rfb4UIn41Cdq8c5g95Ah5MlI9OQ/pQsp5995h4owQqc9kNIrXdX4egscUmrwXc1YjwcqVHP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6926
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 09:07:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2510

Hi Tim,

On 2/28/22 01:47, Tim Orling wrote:
> I have a WIP branch to remove distutils from the yocto-docs, but I'm not
> sure what to do in the old migration guides that reference the now gone
> classes and variables.
> 

If you are referring to text/literal mentions of distutils, please keep 
them in.

If you are talking about references (:terms: or :bitbake: or similar 
directives), then you can make them text/literal mentions now because 
they won;'t be found anymore, which will fail sphinx-build.

But that is a good question because I'd like to have those migration 
manuals in a different git repo that is common to all versions. In that 
case, I think it makes sense to have something in place so that the 
references are kept in migration guides. We could probably add more 
entries in the intersphinx mapping which would point to older bitbake 
objects.inv and let sphinx use the first mapping that has an entry for 
the referred variable. Anyway, we're not there yet... just writing it 
here so we don't forget there's a quirk (one more...) to keep in mind if 
we go for this.

Anyways, I think you can just make references text mentions instead.

Cheers,
Quentin

