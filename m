Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2448.1795166154117392991
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 01:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nSlLrvXi;
 spf=pass (domain: cherry.de, ip: 40.107.159.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/apbLeQL9pf3sucCSMljC/Rr3p8ZHtfeTUSIShdF0f6MI185JjYCUxRuSlibbxK+p/+XP7EpNdKTcERr1wmrYcRQRWSHpxsECUcI2C+jIeZWsUCz5DD0jU78jO8ER4smQCCj1+cBboM8eRJXh6UHuIa3p3UG6srjf7l4XgZ7K/mUhLItALIVLZUtcO4nlDJzDJrPsMJ72FMNGzhoHX2CISAn0uDleGnNy3W9MlV+moylpmWvZobg8IrrjA8ZlkAADSc64W3YDWwUhftJtw7fYpWwl3YPdwSQedK6C6OWTosF2e7yBpskhmCihsscDRxcCso5B0tSn6eKdxQmSRaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSS/jaOC0hLuyG1ymR2+lZu5wwDDdh9D9JuFL4TG8DY=;
 b=lI0iYyB/9A1JCTlKS1DmaQyUsrukvBynIhW9ss0fvHgDH0nXgw/NGf41RqCQAqc9pyiRA3Zu2vRxm57/iytwwnF4hIMdyjlO6rNs9e+aSC8xrP+oDuF1FpnSTejVSIyQwUO3MGaTQWcZ3cq1cb1iWCjnJC0Yamq5ea6UcRTTF9YGVNCeGaRKjvdQQ+OJKsy9h8L+2JY2BCMUlHr2PtpJbgXFIj0CXSai/PqQr2Ri15UrpL/0mKRtRb3x93/SdYKUj68a7yvfVFlbGLhYWPyzqGm7UdLYysxEJuujFQM0PYFomFFG6IF0nQIre70UWfPWpfraWBIG7IlZo8X0YFnD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSS/jaOC0hLuyG1ymR2+lZu5wwDDdh9D9JuFL4TG8DY=;
 b=nSlLrvXiF+DPmSQUVnCtJZmI/Gc6aijZpQKeea0/l5U2i1fnMqb+lajExsHskE5s7YM7gKIPfyBURJdWaI7YGnVcH8BC1bNCTyY/K8w6rLrMsAkLuphk0LgeTqTeE5zB3rjZe7rJEjx9DIoHU5/QGdLymfV2KSUn33k0QQ3GdJc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by MI3PR04MB352264.eurprd04.prod.outlook.com (2603:10a6:290:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 09:15:50 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 09:15:50 +0000
Message-ID: <a0e8d29b-df8d-48b4-b4d1-2324e55822d4@cherry.de>
Date: Fri, 20 Nov 2026 10:15:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] tools/gen-releases-svg: start showing releases
 from oldest active one
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261120-gen-releases-svg-fixes-v2-0-abc66b9dd7da@bootlin.com>
 <20261120-gen-releases-svg-fixes-v2-2-abc66b9dd7da@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261120-gen-releases-svg-fixes-v2-2-abc66b9dd7da@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|MI3PR04MB352264:EE_
X-MS-Office365-Filtering-Correlation-Id: 2758e855-632b-4b49-f6f5-08df46e6de8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dUamS68M42gzIoOAqU9xZTgR7DT0B9w1zf0XxhbgA263j/dnOGzWTsxjG4KXZpy2/unxjuHbAAIVmDvjjIqIxHQ5xA84bZe1a1n0db7uhyP2Cv3TIQl7vIc7zUQzCU3f6IHJMA9oNlyy8nQ46utTaTL9dEImGG2HVCzIuG6A3QCLkXjRKfhw8hiPvcRIjbQphs7RfCcU+ZIlY9MwQLGvhTHh+rgEI12MhctGY2z1RQeF+I3accpTIyQt/BnFsn/YiCP6hGMIW6qI0CC1lc8+x/7JPQTLRKC+1RgT4Hdh1+Y7+DPX+5QnJcg7SAse+hYLyNBkE8cqXTYLn389tTpgXRrQsyscy0a33en+wegewvWNVIxaTH2rF0BpFZVuuT9AQE6R1tjjWkHQVTcIpfGwIkmO/g42yvUaIupOhpNABHqCpG/695K41m+RX80zL97scIuYWLeRJ/xWCsRK4tkVic4NOp3rf0v/vjhsofNk1syByfvUuaGr4N/531wnpjxyy7j6m9MfDYxo5D0Uuk158TNgcupNA8Fvjiv3w8lAiMSO/PXvHWDF4Ci5H8ykkypJh3cK2TaEbT5tU7wkLV+RDyQyDDyI+g1eRfZziDm6jokcnY449NQ72uxVBi5bI19L1W4jXxcZ7Vzu5j+1QFWcYgrI/ojR/LG4ZlIpICfRZaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTBvcWx2WkViZGgxbXFXdVlwcDcyWDdnZDhRYWZIR1diTksyYkdQNXFhVitQ?=
 =?utf-8?B?by9YS1dkZi8xRlBQQVJjcWV6OXZtamVvMVprc3N6YU0xQVY1Y3VCbDhhYUQz?=
 =?utf-8?B?RHQvQlc3R1lLSHA1dmFNSGEyRzhISEVQSXovK1NDRWhiOWVDcHVXM3Z6Qk9K?=
 =?utf-8?B?Wm1pbTBaa09uaG5ZTnFNSENvWmMyWEZSeXVzK3VFVjd3b1FaZUh4aTdyT2xP?=
 =?utf-8?B?enlkaCttRlFpTEczZHQ1b2hvVCtYQjNOSm84TDl1U0xJMEoycVY0cElEMmRi?=
 =?utf-8?B?Rlg2akU2S21lTUk1L3VDZzhxblVTdFlXN09POGM5Y2xNMFk0MUtEYVNCT0c2?=
 =?utf-8?B?c25NNGtVTmt5eDJwak9XUHYvNTNRYmxxQ3B4QmYzc2xYK3F2K2VoaWFEZ2pv?=
 =?utf-8?B?eE4zTGpJUFo2dzdMUDA4M3BIYWJIUXYzMTNldXJWZUU4WUl3OFpIbWk3Z2gr?=
 =?utf-8?B?NzhUUEpLc080emU3SzRnUWNjTVZxK1B3bmFHalRmNGJ6M1N3VitwOHQ4K2Uz?=
 =?utf-8?B?SEJsNzQzYVFTb011bldxVUZ6UFIyMm5nbnBYa1pTZFd0R3h3UXpIYTBlSmJG?=
 =?utf-8?B?d1J1SjFyalNxWmEyY1VISk0zWmVLWldOOEpTL2R1R2J2UkNDTlorbEN5Z0pq?=
 =?utf-8?B?UmxmRDlwekJpRTNqb2dFcjYrb0tHU3JzbmVBZnNmcGdaQjBTbjZsSXlEQlhh?=
 =?utf-8?B?VGRwMHZOK3NTVkM3ejZGN016YkdiQmYxK3l2eVAveWRxbktpRnlSK1JCVFhQ?=
 =?utf-8?B?Z3orclFDTXN3NUQzVGZObkpWQ1NOUFc3OHdTRkpmQmJqSGxUeDVCT2IvbUxS?=
 =?utf-8?B?YkU3bUo5RHFNbVVHTjNLTmZIQWlaTVZmSVBNeXVBQjk2ZHN3bE1GS1RrSThG?=
 =?utf-8?B?S21Sb3RsN1JjSTMvUUJDYmRPL1JDbUZmTEM2dE8rNEpickUzTElvQjZveHJZ?=
 =?utf-8?B?bXY0Zk0zYnVuaTg2a0NIRmxkMThndEpzV2Jjd0I1QWNuNVZlY2hFaFRHRGRj?=
 =?utf-8?B?dDBFYzZ1NFQ5MHdBRTNQUFk0eFB4Y01JbW92bW9OeWJ5cTRzZEpzRi9wZXBu?=
 =?utf-8?B?bzVPQVA3NDdRTm9LbnJGU1VOeDV4dmx5elZkZzAzYnVWR2EwUTh4ZVZTSkFC?=
 =?utf-8?B?UlVOaytyZXZGMUo2WC9QVXIvZzRZV0REV2NQeGgzTzNYQ3FsWGFrV2xkSkJo?=
 =?utf-8?B?L1c3ZGc1eE1hUmx0cDRkVG1HMk1Ec2VaVXJzY2owQnBadHl5L3ltMzhOSE1L?=
 =?utf-8?B?VnpCekFPdG9WSkg1SXRvcThybUdhOXNONjI4eWpzNnY3a3lrdmtkUmxlTmh2?=
 =?utf-8?B?QldDUEpSeG9ic3dNdnFMbm00bzdueFJMUVRYSGgybG1oc0xta0lrUWZkZDdp?=
 =?utf-8?B?WHFpSHRqb0Z5bjRSVjJXUXg0YkU1TGQxaFpqWjlJR2tFb0U2ZTg2NEFOMXM2?=
 =?utf-8?B?UEx2a2IzV0J3elJ3c0t6TUpFM0ZmcTBTUDBBdllCSVMyZkpUMHVqSHZrOXc1?=
 =?utf-8?B?K3N3YnNkZ2V1dld4L0sxVk1SR0Rid0JQbkJBYk9IdUdsOHMvS3QzNkxBcEk1?=
 =?utf-8?B?SDRvZDREV0RjTmNvYUdXbFdQdlFpR3VGSGh5R245RlcvWlQ5NitCSk5nWURY?=
 =?utf-8?B?eWt1c0kyd2FzV1VERFZtMUZJTVZCVTgzOFQycjk1ZWlQZEtIeHhvdXNOczJ4?=
 =?utf-8?B?YjVUb0piSnpKcTlTK3FZNklybFFyQUpxQmlFdVlQdVFkTlRHRDBZSFFSYlh0?=
 =?utf-8?B?eEluWGk4V1dIOUZvQzM3NlVNVjhtUiswN2laUWNUNTdsaGZ0aU8zaTF1ZGlw?=
 =?utf-8?B?dG9pRUo2Z2ZJYXNJMXBoU0VUMG1Ha0NUc0VoZFdOaDZjUnRFcUszOGpOY1p3?=
 =?utf-8?B?d1RBRlkyZU1tQWtSTlFkOFZrWDBaRGY3RVJLUGtUeGkwLzNLMTFpSnVoNVUw?=
 =?utf-8?B?bzZSVXlXWllGVE10aTFtVG51OGdIUFhXRnVqazVsdURHbTkxQVV1YmRRcHZq?=
 =?utf-8?B?bFVDeDk4LzUrNVZ0UlN3MDBPZ1V3Z0t4Tmh4UHJnbW9UM0dkMmk0dFdwcTB0?=
 =?utf-8?B?cTdXZEJQd3AvUlNaTFVXZDFIM2dadGwvS2EvY2NaYUVSZVJPcmtpY0s5aGE3?=
 =?utf-8?B?TmpQeG5tK2pzTHpibGRQdWxJMndQYldxczRra1dkYURxbjJSbFFDNUh0eEhx?=
 =?utf-8?B?Z1ZGNjV6MllFb0tZSnZncG5qaWRraTRpQXVva2dFMVk2S3UrZkNvWWNUQVNi?=
 =?utf-8?B?cHJTOVEyUlFqaERoYU81VjBXM0VqTjVGTjRBWlpCQ3Z6dUxJZ0hvT3pSNVBD?=
 =?utf-8?B?NUdzQ2hXN2VLam81UmM5TUh1eDNNL0FEaGs2WDUxVjZKZnljblF2UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2758e855-632b-4b49-f6f5-08df46e6de8e
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:15:50.2515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceowGFQ2P2CV38rPQ39BhDQuHoc4qssJbfKJI0UtaW7ljyyt+Bggn2NcwGTO5hS8tNCEcsNXv4OjZ4lkIaNhFYKSMDnvjZsl9BQ3B9DmD9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB352264
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 09:16:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10813

Hi Antonin,

On 11/20/26 9:14 AM, Antonin Godard wrote:
> Instead of a fixed date (2022-04-01, which represented the Kirkstone
> release date), show the releases from the oldest active one.
> 
> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
