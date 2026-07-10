Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4F2C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 15:14:12 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86.1783696444310613095
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 08:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lAPgQPIV;
 spf=pass (domain: cherry.de, ip: 52.101.66.15, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnW8EmVkqY4rIxsnW0eCTaVsKKGqLBCHLjdXQt6tbWSOlTU4HvGrmGoeUCHtvGnSMI4bRYzlV7oOxE+lug/Ihb4RgnZbuVudLv0TrTyERFpP4VL+WR+jlI9q7rjDaZIuoy0Gudvkmi8CDY+I/ZOUPJA+k7uHliyDHfvg2eE0cALXcPzeFCytsf6U2thN6Y65va20XFtOZlIbfeTipdRkS61AGVBizPkf9S0TzfSD8C7mDvqjFmiqt+jelX50cQXYW829NSBle4zH9mAIhHXRgn1FBjOH3NvI7XY6pj8aXdroauSQofZwlmyGC3aG2LU6NjJDmujxfFV70sD7QtInpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnDx39bKg5S7elLsZqwdZBYwett7e2vj7exRbiwfvUs=;
 b=rPyzgyYXUAanpHI/NC6uOZxom/jP2YaHZqz03YhCw+LMkrcmQanOhwCnFQmwshlAsgQ51W0wHWpcDxPoQYfjqGBjRN9lw087XLCqCyC6vvJlcXbNTm0/9et4LTf0Wngghw60HVJ2mpCtTmswzneLNpDgbGHmbJytEPrSyZGPdCi8yCATQhTkeYTzCXFZH0R1O7PRC/gw52htFEeRK9WtkWPgO3RUDoj1sfpSe/y/45kR+LSBFCk3aYiAae7PDeP3F7gWLVzcCqTnoMjrrndUXG/DW/3eeZWK7Gu7EJTacKbGiO0l90iQdoDU9Uz63GvG4Ws9J4gxg81hS2zlzrJ19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnDx39bKg5S7elLsZqwdZBYwett7e2vj7exRbiwfvUs=;
 b=lAPgQPIVJ7ttIR7Ya9ukS51f8yIjZyS/e6FBNsYyPguJPEID1q5lXt6MhwoHbB4lhkc8EBups0zM3yIL94ouh/OgzoU5s0VqFOZIJ8eUm+9D21pzAoAT5+KNdn+GBD3iRrNuduHmUvncH+yycQT1bXKrU/OCOyDwLzFxkNauIbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA1PR04MB10503.eurprd04.prod.outlook.com (2603:10a6:102:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 15:13:58 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 15:13:58 +0000
Message-ID: <8e57cf03-7e35-499b-8528-068e518f60ca@cherry.de>
Date: Fri, 10 Jul 2026 17:13:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/8] conf.py: add extra links known to be broken
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
 <20260710-linkcheck-v1-2-999168371d5e@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260710-linkcheck-v1-2-999168371d5e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF0000051B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::676) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA1PR04MB10503:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca7a2f1-f52e-49d6-879e-08dede95ddd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ulijs7yMNnsSc50cD1zYSu+0brSUYE4JO/Jc2qaOsDHwnkNF13GyO3/beY+B0OW9PyqwjXX/0Vl8A7bKbOSa+v7i6kW8NGuAmGQiZFB+FBxHY+5uZtsqnQLbkiqRx1K4ktwu7d/1C5bDUmIR3kS7jJprASbvNPtEWT6y9WELmBvRYqAOJts6gQ36Sdnv2WiotnAu3aLUeyu9kSSihqU4/YaxUGvfMs0SVT+It8RSc5rESCzJo/TvTj0rt8R4rjVeFhO1SuqO6cnUwwlxIqQDFbZ8u9xAIg4cmjzaF6ITLqher1HnCPmq8X9CMTZvA723w5MHary81SmFXb+5rQMUs8eoHZ/1jqqsphboCNS3YhouD/xpmH7e99bcJFyBbH2dXfplolHG4FREkCvdNxIkgIeWgb15Q8ogFP3/vkotd/qIdJhQ8xUW06cfYTXNy2cFi/hSE/V/at2uMj7Q1K4kJvwR6huDpIjDz5AtFtmi7w0LLY+FHN5F86pIE6pV2UQJZ+O/aHwtg6BUO0lLkkieVWkGUbqxjKROauu+B4LPYL6pq7Kenp0NEQMh5bn8ykTuQSi1+PLfnZJmyLpcCDO9xfUCnNAGc0dvF2THBFasyhaoOP65o8U1Isca0VQh7FAaBp6L0KpYEWqX4t9Z+SjyHoWF/wk5c7PklAYB807Ho00=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFNSb2lVNlcwa3RPRzZkN3pqNG92U0N3T3U0RkpzQ21xWGVMWitCQ2lmVTVP?=
 =?utf-8?B?T1dYYXR4OHlrYlBZaVh4YVpQaFJpc2tKMnozTTh5M3B4Vy9ESTc5a0Z6bFl0?=
 =?utf-8?B?RUVORnZ1bVRwMHphSVhmSE5waVh1SFZVNUpMM1k5MkM0WWlGaXJ5eDl6Rnln?=
 =?utf-8?B?VGJsMC9ucHU0RFVIeGpyZEt2OVBwbk1oWEg2cVB3MW9GdmlYNXMyVS9weWkx?=
 =?utf-8?B?ampsb05SWDhON012dnJOVW9WNnFuSkY1NVJ6WTZ6TzRkaE84amlNQVA5K0JT?=
 =?utf-8?B?bmdSN0VSTWlML3JudkpHRHg0cGV0aFB5MEQ4U3UybEMrMko0ZTVnd2lPL01E?=
 =?utf-8?B?UHpGRlRVaFUxUXZSRVVsQ0RhYlo1RXFrYmxIT1V5NnZxaDA0L1lBZGRWTE83?=
 =?utf-8?B?NWdueGdhUnZLbnBHNTZNNDh5WUJaZzI4Z3JDZjlkL20yWE1ua09EeVVXc3lz?=
 =?utf-8?B?SjV4emt2ZzlCN0dSYjNyaHJLQW03WnJPTGc5UzMxS1pUSjBkUXBIYUZ1enpG?=
 =?utf-8?B?RE9HUHhGUmFjVE56MmxNS2QyTHovNGZwZnBNc0tOQ1I3bnlyMVZpWkUxR0Yw?=
 =?utf-8?B?VkZyN0doUi9IWlNSNVhHNVBuM2pEaVd4VXpUdTlEbXJqM1UrMm9zSVV4WG1E?=
 =?utf-8?B?T1Jid0lpNk1ETWlLaWw4bVNpQlFDU0VjTEZFV2hFOW9pRnhIaEc5ckE4OHAz?=
 =?utf-8?B?cmt2VlgybWJvNHRTVDN5cHowS3ZoZUpMb2pWaktmVUJ4SUg5K2JkWjM4M1oy?=
 =?utf-8?B?THpSeHQ3SEpGRUJOSndMcGdncGtLemovYzIrTi9oYm03emlXYzQraGVNeHZi?=
 =?utf-8?B?MmtjQTFWRy81bUFoNHdZbFBaSDlCb1hiY1RuTHdXSHRkNzFBck1hcEpreHBY?=
 =?utf-8?B?aWlOSVZyakQ3cXZLc3FuWExvZ1o2NWxVcGdzWFdmS1ZXZlk3VHI5emtuV0tP?=
 =?utf-8?B?dUZhNCtDdCtERVZnYmlPOGxFVFBvV0U4ZjFwWGNvdmZYSUx3SnJBK1pTNHdq?=
 =?utf-8?B?dW01emVhQjB2aDRSTnlzNTRKM1FHVzdlZGpKYytDcFRoSjdwbVRyV1ZGWEo2?=
 =?utf-8?B?NE52ODBSdWtsOEhRVUg5M2ZleGM0Sk85cHJWbTdCbk5ZMmFuazdQZUFFOXpC?=
 =?utf-8?B?cEt0cWR6ZmYvQmQ4dVRIQ1pGemVFbjRYbnBSamJUazN2QWI0RXFOSWxOQmp3?=
 =?utf-8?B?K2dXbWhOSHdpVXN5Snd6NjZyWElTMFlpUWNQY29HUlNaVWoyaW4zRURzeGhh?=
 =?utf-8?B?MldCYTlkYlViWGF6azV4bXJreVJLMUdDTnRSREdYRVEweG9ldWwwcnJNVzlq?=
 =?utf-8?B?bjdTOEhxb3lYTWlBQ0czeDFPOG1KTVk1QWJxV1NzdE5zK0FwZG92TVJNK285?=
 =?utf-8?B?L1Y0MS9OTmZrSVZySEJudkFVU2doWVh3ZEl3RDNGT2pjblN0Y212WUtSK1px?=
 =?utf-8?B?YzkxdlU2NWhjRlR3L1YrUElCL3hBdTROeXBjaFZYcTkvTGp4VGs1dDZuM0Vo?=
 =?utf-8?B?TWdpRFl6TDNZVjFSL1gyOEsrWUJCaGNVR1lPanJmVkcyL094bi90MHgxWVJp?=
 =?utf-8?B?Y29aZk1QcFJockpzOWFVeWo2VDFLcExDYVBOR0FNM0tIc0N1eGpMV1dPSWxE?=
 =?utf-8?B?ZENaQW9tWjZvZnkxN1p3d0VqbnNDRkZlZTZVQ2hTRjNnSndmNGNta2s5aExJ?=
 =?utf-8?B?dlJ3Z1Q2dTJTK2xyY2VQSlpCYkp2WWJkQ0k3TkRMV3RNRWhSbXkxc0x1aUZU?=
 =?utf-8?B?WlF3M1BUaW9jVXk0UDRtWW9pRnV1ZHAvaXVFSGdaQ01oTVFkVzF5bDdEYUln?=
 =?utf-8?B?WGRLNEd1NDkvNmVLQjVjU2FtRm1XbisyZ3pPSW9henZvOTZRKy9lQTVPYmhL?=
 =?utf-8?B?U1k5enRtZkpJRDdDalpJMUUvQ01JMmNPUTZpcEMvNncrWGZ6T0xBZ1ZWaEZ1?=
 =?utf-8?B?TmZHaEZNcWJSUGtZZU55b09lK1JRenpwdU9qdHdlWUcxblZsSnBUMXJUcERL?=
 =?utf-8?B?WTlNcGtUVVRrSE8zTWJXazg5dDJkNmpEMkdzU3Z4Q0lhbUJhdzZOaE5qU1FY?=
 =?utf-8?B?a1hKT1pMbTBSVExPOSsvdTJwNkwyTkVzWW5xaUFnRkV6KzhqbldEQWVKcmRE?=
 =?utf-8?B?VS92VVQ2TWlwMktQRzhkQ0EwZ2diSDNVa0lxSjRwZXNIYkFDUEJsMXBJaFhD?=
 =?utf-8?B?SUdHdTI3SGVCaFVneVpJbWlNK1g5T3FNYlBmNlgvelJXL1Fsa0xxWEMrVmVh?=
 =?utf-8?B?dGRnUTg0MXNpK2NPWWlPdXJtTlpxaXlQeHJwWm85VFcyZnlZY3dud00zOFlh?=
 =?utf-8?B?dkJqclYvZGpFYWxTVkNnRVdqSndoUGtxQUZzL1JhTE44SlFyNy92UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca7a2f1-f52e-49d6-879e-08dede95ddd2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:13:58.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+vxwEbQTv2ufmh+YNOeh54WZYfrkRsTeZgOoxa2ZZaCr8LhEKhDnF1EDg8IsSXhE3ZfGd6dywh8XMnNnVAu3qpPGwtrPNAtROr+tJDI2gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10503
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 15:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10066

Hi Antonin,

On 7/10/26 4:46 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Those links are broken, yet our documentation still has references to them
> we want to keep, namely in release notes. Make the linkcheck ignore them.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/conf.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index aff01c1ed..a5b0add8f 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -156,6 +156,16 @@ linkcheck_ignore = [
>       r'https?://mirrors\.edge\.kernel\.org.*'
>   ]
>   
> +# Those link are known to be dead, yet we want to keep them in our documentation
> +# because they still hold value in the context in which they were used (e.g. in
> +# release notes).
> +linkcheck_ignore += [
> +    r'https?://linuxkernelcves\.com.*',
> +    r'https?://gpe\.linuxtogo\.org.*',
> +    r'https?://jk\.ozlabs\.org/projects/patchwork.*',
> +    r'https?://rlbl\.me/prelink.*',
> +]
> +

How about we replace them with archive links instead? e.g. from 
web.archive.org?

For patchwork, point at https://patchwork.ozlabs.org/project/patchwork/ 
instead maybe or https://github.com/getpatchwork/patchwork?

Cheers,
Quentin

