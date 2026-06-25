Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8874CDE00D
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7009.1782378119275753478
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EPypy3ZM;
 spf=pass (domain: cherry.de, ip: 52.101.66.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ea0WjSaHSuPYw/TCa4B/c4oAeZRqqz3KQusRKAj8lBJv+P1R6afyhyHNJsig8yUl6atHjOXRrvBKN1Z7hfi4AEf9OXv9b5LpkjzTiCxeNU+um5DVixGWORrZJMpqb3cQ/qUKoRIqp0mBt5J/jOCJpdJj4FQhAZGAvzR/62/Dubxkqy1fNy0pJKc0Sj208sFB8Ff/edJh2xl/YHdHOpyvf3fXR9C3u9DvikNw4oDN+yUj3chuZafrR0Tjg8uoOn7nQbdYsnwZkNBDKTRzKrJdrNBEO9HToMJBAmbrLy79farSDNLlj2XA4YF7uo6WFN345q5mg1S94m9GU+QDRTLmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYiNX1poF6xhA3vnzs4jl5KvmL5KDr4GTLSQVFWqWzg=;
 b=Z+Ejq4I0PivE2yDYyvn+KlGm6TWsmdb0FLcDyn1Hxm1Yq73kp0z4RpxCSNn3SLKyfbeE0/RrPZozL9ZB5243KQJcTkUfNX6VP/zrcacI/yhpIppq3LeggOQ4IXbzxz/iF6xsjHH2XzyctUlp5TbSmHHcOMcIjPOjzs/oNeO77f8mIdwETY7VPu+UrCjCYKFQ25EnOiYTxrdKphSozftMb193pFU7Tm50M95eurNnE8bzZ6CnwI+HAH3WM4lQvfzyyx6UrKoBo9ePBfmJ7d4yl2VTmeESIz9Ld6v2UuJ8KQ32evsRNGlT8uvoxwogCAAQKmGUMtNQ76Kgp5ALMhQVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYiNX1poF6xhA3vnzs4jl5KvmL5KDr4GTLSQVFWqWzg=;
 b=EPypy3ZMXT1OEcYxXccbP+kbm+M1ZpMvsxdFJiYniJ5LeTpOBN0g0kxfmrui8HBo2Ah/OsoaIDDfmhFjjOcEtpORJ5+IyVUg4WWQaZx2TXNf1ln2p9pVUmnNCOCzcYraZcvrODuD44Pemyb3tdG+9amV6JLdJW8OE5/uIuiuHs4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 09:01:55 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 09:01:54 +0000
Message-ID: <a20a896a-4434-40ae-b9c5-afec6d672b7a@cherry.de>
Date: Thu, 25 Jun 2026 11:01:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3] ref-manual: add missing entry for
 build/tmp/deploy/spdx
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <5d1922b8-dd2d-8a47-dc3f-fb3a8d017947@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5d1922b8-dd2d-8a47-dc3f-fb3a8d017947@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0165.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35d::8) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 063bd6cf-5974-45c7-8554-08ded2986729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	RuwVoZ483grpI2FSwOjns8+8TawoXjZcrqYZodZx0mCkGM3fqvCZX07X/p8ZL9VagZeMvMSM84wlTrI0ZLTVm4sW543tbhPoVlffzfUKTG7AKUHSPNmFJoAGcr60ZAYf8EMXW9AOAElgil22N6iu12kzmd2XCPn3yBrq97ibhcNav5LtvFH3n/UdFLFZqAxsXiSA1T7mEuVPHkA6FAlZVqOynSdt+gLPfuGowHy8ead7bK++70n1U53ofH+wiHstt/3ScokrTRgSeo+PhyOLlz6M0CSU4sE4Wr0wLnkwBiN1nIrItqngyLzQpULFrr+e/X8RWpz7VLQCcWyylC4YlalMlHwQ86vLQprUFzcELiVn97lWmN8jcwluOX9m1MilRowDgMucXCUiYt7EIh9eyYYrr2nYE63/zCf6qpjbOLRCWdyvvqzxKtN1mv1xBD0p4LlrpQ9FJwvKKEj9p83Yt/mLV+ZKhvp7TyVjYEFng0qWqFmzI6O9uC2smzbTjnodAW0N3VuutU079ZuZAczGjNxJn66Vv0HI5Nql0Gb89balr7AgklABhz4zBWaH76vU4KhESUTjcchN8EDfBEOzN7K8GMTYIXN5RkBtTqdOOaIpo4sksQrMjByXM6uCHq41sbkLyKp9G/4ck9nsrs6D+dKdOpRVuofDy2Xv3j/ebTk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnYyQ0lTaGpmN2NrTXZzVnBGa3VpRnRXRFN2QWswbUg5azFkWFdDNU05Zmkz?=
 =?utf-8?B?QlpWd1JzWGN0WTUyT1hoY2ZvSDJ4SS9ubUo0OGJxQkhqbkFZWTd2SGRzZ0c3?=
 =?utf-8?B?dC9oMzRwMDFuRnNQRTdNT2NyRG1QdGpuZFFjVWRGdURCaFArZlcvMGNGUC8r?=
 =?utf-8?B?YW05ZU1zMGpiRDRUUlRuQVByNnB0UUpYbWxnVGJyNlp1RVNsK2M1TDZLREkz?=
 =?utf-8?B?VHNHSXVZUzVYdFlMQWtwMWxqamZpMmx2dzVCSnB6anAyNU42a1NtVDU1d2xX?=
 =?utf-8?B?WDNFUUVSYzE5SU9mQU5TL2RZVTZnQjc2UlRNUXlJVHVidG5tUC9HY2lMYmJE?=
 =?utf-8?B?VkhMaFhKby9wdWlQbzBMNFlISDF0Y1h4eHU4THJLUHdGSi81dmJaTDl3NU80?=
 =?utf-8?B?bFJJM3BvUjVyT2VwN3I3Szd2Zll1ejVBTWY1SXp5UHE4dHhxYmdXbGZGS1lR?=
 =?utf-8?B?NUhpanBUTWROWjdxSnVoeTZOSDJnR0pUTnBMZThjb2VVekJkV2ZZeE1LbGJY?=
 =?utf-8?B?ckVERnRUQ3Jrd1FLcHhXMi9rSTdxUUpaeS9aL0RBaitBaktmWjhySTJNZ0E1?=
 =?utf-8?B?Tno5WUpVK3c3Zmp6emVLVEE5NkZMclR1cUllL2ZWcTByWVBYUWJodGovejB1?=
 =?utf-8?B?M3k1dUtMbTZ4bjhrcW85ZmFsU0dnc2tkNzQvSTEzYUFoSUtSaXhNUzRTdzA4?=
 =?utf-8?B?M25nOFh1OXRUKzVITVU3dVdnUGZWSmZ2YjNzUWcva2o5Mncra0RYSGlPMEw1?=
 =?utf-8?B?di9CejRSU1hjWnJJRUhGTnlGR1FuTmZaanV0VGZpS1V6L0dWTlVaK2VwQllP?=
 =?utf-8?B?NmwzVllSWGRSWnQzNElXTnhtUlEwZHlncWZjbUI4NlZIRTJlcFlLWGFWS3lj?=
 =?utf-8?B?UUVuU21sQUxHS25FMXFWUTMxbTVpRmU3RzJVbGJTZFNzRUhFRFhRZ1l0Y1hM?=
 =?utf-8?B?WlhBcEw3eEpldnpBdU5RVElicGVJQWlNMVNYQ0hTV29MK1J4c3BENjFFcVFZ?=
 =?utf-8?B?ZFpOWXh6ellmZ1VrS1VwbzZBNStCbmI1bENDRmxvc1JZdU1EWVNrR3g2Ry9W?=
 =?utf-8?B?WWc2REE5T0h6M2NaWjRGdGpZUVhCbEtBS2x6ZC9sY3ZPeXd1bHZxNndhTlp5?=
 =?utf-8?B?c0E5a3VwUEYwWmtjMUMrTjJmVjNVVnlRbU0rOGZWTVlLSituQW92WkE4ejBq?=
 =?utf-8?B?M1BUYVQ2eXVVeDRLRlh6OWh3K3ZXamhOazNiSXFsZ1U2cTJSYStpUGI4d0Ja?=
 =?utf-8?B?UWY4KzlDd3B0dUF6UWFuK2FhL1ZWaXFGdE9HTGlXU24vUzhYYnVObnFWbzFp?=
 =?utf-8?B?YUtpdWF3Yk9HbFBZWjUzbmRjOW1ZSWxKb1R0QXpmeEVuVVFMYUEyYmdpRGdD?=
 =?utf-8?B?VDhOTDBNY1gwMC9IR1hpMGxMMjQrRXpCR2wwZWRLT25wTmEweGRWNlp1VDA0?=
 =?utf-8?B?WWhGck84c1VJRmNvYzZFVjJSVy9pYlZacXFNeGpBZ3RrWFk5N3BSZ0JMUm5P?=
 =?utf-8?B?dG44UVRNYmZ0eTM1bXhxaUJFUGh0UVpxWEtQMXdEUndjWFc3d2ZvZmdhbmcw?=
 =?utf-8?B?VWFSZldzeHZQZDdTTDh3UUl3QXJpUVluMS9seGxDS0dFZ0hkWVYxWlFsOGNw?=
 =?utf-8?B?bWNmVlV5S0x6RURLZGROWWlvYzNQTVV5UUo3NHNheXpoTUpZTE5RbG02UmZX?=
 =?utf-8?B?RTZGWnlQcUszenYzZ0tUYzBPQ3lsRW1iNTM4dE9KME1SL1BPTHhDQjBaNW1p?=
 =?utf-8?B?eDU2ZUxVam1BeXd2Qk02R0xaL0FzZkpaQytsYWQ5SnZmQ1ZGbytPZVdXQ0ZH?=
 =?utf-8?B?WUxRYUY3bUxxVkNJTHkyeUtzc1N5SThoL0R4ekt5N1l4WFpQQVI4WE1pWUk5?=
 =?utf-8?B?Y1Bvc0lMTmxIWDNiQjBoZFJpa2JIeTk0bzgyYW5nR3B4aEdVYlJIL3hUUFBz?=
 =?utf-8?B?dUJFYVN4NS9GcTFyamVvTDZOTERXOURza1I1L2pCK04ydHJuU3dsQWpOcXZq?=
 =?utf-8?B?QllaelBoVzM5b2xZK3dUN2xFVW5OcWdrVHdHVzRpRk85WkgwK3V3VEdkS3pD?=
 =?utf-8?B?OU8vS3N0ZjhtNjVHODV1N0lLQm1aK0h6MVNlVE5GNXJiTUQ2ejNUMXdad3Nx?=
 =?utf-8?B?TFJqWlRndy9wQkQ0MkhpN3JjRmZzVTAzSkpzeGZrL1RwMUFqcWNHV3dZbkNo?=
 =?utf-8?B?WVNMMnJTcmY0L0UzU0dqOEVQUmVnbldVWUJ0eVNCQ29wUlZ2ME50SWgxdGdW?=
 =?utf-8?B?VlNUeURUZEsrSHdsRnhFTjZsVHhvamZVTmR4LzdRY3ExL3BWY2ZLeUNkTlpL?=
 =?utf-8?B?QVlaMzhMaHQxVW9odmpEUTlzd3MwWFRreFNHTHdTOUlqSFh5endtdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 063bd6cf-5974-45c7-8554-08ded2986729
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:01:54.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMQSMo2idcvvz9J1l6l77v66KqnQ72rDyEhMeBPstu/YkDLJIWU3l3+HMjmD3UhrJYadaYU7KOH9jyMDK07ImtAjxdf27i0l8bzz0CjFXPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9881

Hi Robert,

On 6/25/26 10:31 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> There is no entry in the Build Directory section for the directory
> build/tmp/deploy/spdx, so add it.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

