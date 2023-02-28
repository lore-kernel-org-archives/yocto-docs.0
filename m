Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ABAC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 11:15:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.62])
 by mx.groups.io with SMTP id smtpd.web11.20867.1677582913671506752
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 03:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=IvtrAK6j;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.62, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqMqlBqoJAdJZJLSTvpmSmmGhdFEu3EQrszEOow+NudWIDY6uwgl+QwTJoTbFUWW5AZ7/Ejs3jogD4zqME1+jAE2XoEMd2wTXgzlZgFRF325nf8ZTCe3oGKcKc+LtaN8hY9e8bsAuWyjoqzbPjZHVgU3w3O3nOsn1dO6I3yECtODxJSakDHdzZsJ763s2j6t+Gr72e++YFgquomF+yG30AcAvfVhSZ19jNd2PUhyakCg1lpQb3ML0jNCifkS7cPxyGusGKNaCr3onIrllBdaY/i6lEgxNyhwOcMROlXA+c/W/wjG2y8TIj0ATChc9lG82/cqetKHxpGMDUYE4kFq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N52pUscocALXvDFDCqL0aFAhgG2bO02eqNJLNWhgh00=;
 b=TPWW1K8RWkt23Pr+CRSw0VwZVZPVCTEBunLmiDoAP9WDdEZuwiTecfoVVThdOQuCyDbEvJL9922Q53qUlaQuRyAos6ielC0oXw+uGMtt5VvAhtMe5SyD7V4zAp2qkw5MCwMQe2yBywnRGnYuppcHuAEpDDPKlPw6BjiVh4V/b4cx2zfLW/nysMazgArrEI0pXJ5umHCPGZliUlVzAX7Rmt9Munabt14NCUvvIEw0MWqnR9YPaSL0zZJBGpR7xfwNuacsU7/4RFY0TwqCmMwC2lHVEJthstZ2TWeB8qj7uUZIj7yB/Ly7ICh6VLYRYeo7rEz+xS1Ad3Qb/YpnyEsNsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N52pUscocALXvDFDCqL0aFAhgG2bO02eqNJLNWhgh00=;
 b=IvtrAK6jjXwWt92gVBZh0eFnpROljob5JHxRr0wVXg16JFAjKGA9SCOeddaIiKjgm5zWHYgWm3g0NPXFFEne8Njon6/KfDlY2h5QfnxfVkHIMLvty82kXyzlBwpHXSMGG2WMTcFmY6c3ZRX5Wy7cmc1SH63aIzqnI9xDMfz7xvzTFSfnTT6MqsivLWeWGfURoR5llfuFWO7c5+NL5PhEBtcEIQuBLEt4KDs1BwwQLCbm70q4V0ozRS5P4WFNIm+2hrAJEBkh6AC80jIC7xAGbX8ydChltC7gISd8hXLUO3Xul0YTFaNU1q+oqnSULVxb1LF5Llo0nfq7pBxEdY693A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8929.eurprd04.prod.outlook.com (2603:10a6:20b:42c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 11:15:10 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%6]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 11:15:10 +0000
Message-ID: <6a26afbf-3669-bcb3-5add-e9e5c38a09f9@theobroma-systems.com>
Date: Tue, 28 Feb 2023 12:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [docs] [PATCH] dev-manual: simplify references within the same
 document
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20230227150137.271106-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230227150137.271106-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 452f8675-4ff9-4789-b801-08db197d0e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y3jW7g/BhuU97WUViGUdBKUJ/hW8Mt3zqpe70r3sYjhgRr/Ifc0dbL63+zOgARw2wLFxVQBqwJXyOcRnH1vYTopSMACmd88FhwiU9ERLDa/olUQv+9Z9p/U/Kj5QsfZiO7KfkaYWSyCoA3OrR6gpiI8N/fJs6JUxfTDexEG5eyraEhWONqidWQW8XEFGjQ0+d+cPLW3kqssvvvzWfRYEptbOJFPSzmkZEwKVaQo9s9wse8UDoSP+DkaYFI0sEhY5irhjtxVOQ+8L7Pg+4M6l8xDHNcGNC32pBX4twcPXAH+cTbCL6go/cVw+7aAMF0rfa3vLvqi6/Hg5H5jKLoUJ7eXJwXNC/gVIecsdWAPKutgNUKwFiUH18FnUgIOHqO2em+aPlJ7wRcAFs+7njftHJlqk4J6Q+JDcmRIgOzeReeVjFdVQyY/k7Ho+AV4Ex7EN2f0GEVfwXpRkmaLnPJVDzXYoWFRBCDMC4ZqFaw1422zHCd4+3TO45DAzEWDWd5NWeDGZsBsN1N9iRHzRCueWN3rHtgpHIhjKWFRbjx8BZR7jIX8wVZyOaKJ1HbriQu60adqgEM0QSCJGybOYV+ltQAhb4CZl0KpQVujrlExzC3OVlYq7FPJ9AlUzadZA1E9/mr+BdJqA3jNHW9+EQ1mfL/503bEIYHddE3NdCZkb7eYrKu0XkZSU5xKZ3LViGX49hAfwt2BGVd/XYz3u7wAa1lQAIWxQN1LwsZKtC7WM2QXWz2zKVMHhVVH0qxPtHo65DrgIPLfK6MDaspeuEoMSmysTs1iEB7Oo3nfI6vIZ5SI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199018)(31696002)(36756003)(86362001)(38100700002)(66556008)(66476007)(66946007)(41300700001)(8676002)(316002)(2906002)(4744005)(5660300002)(44832011)(8936002)(2616005)(83380400001)(478600001)(6486002)(6512007)(6506007)(186003)(26005)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enphbDlMN3V6eVN6WVMvVzlBNFo3d05KUTJMTThOZjlaZC9jeEtzSjJxQnNZ?=
 =?utf-8?B?YTBmbEV2ZENhZFhSb09hWnJFQVVMbkpNTjFWbU1ES25leFRlUnVLN1doaDA1?=
 =?utf-8?B?N09JMjNPZS9YUDJmNmVORmRrRko3OURxbjhTTXMwQU1rc2h6NzF0VmsrOU9h?=
 =?utf-8?B?eVRyU29GSlRVbHg0TXVSQ0dnSG5zWk9udDJhOVAwVERzSXUvMkVJRkpvZ2Na?=
 =?utf-8?B?Z3ZyNmt0YjJ2NVJHNFZUbWVidFhHckJWeUxBRWRaOUxHaDlqR3dPZ1NQaGxr?=
 =?utf-8?B?dTAxdUJkTkRNQkdadmZzRm9SKytPZEVEUWh5L1Q2R1hjUDhRbHVYbm9xZjZT?=
 =?utf-8?B?bUJrOWVnenZmdGl4dGRGNHE0aTVPc25Kell0cy91S2hLV2hFYUN0RVBhMWZI?=
 =?utf-8?B?NmhhN0F6M29TbjVpS2JOejdsSDJVRXczV3NtKzRpTlc4K3JOSFpTRjdPSjlJ?=
 =?utf-8?B?LzBnUm5RaGVHTXJ1MjdBaVZqWEZkRmliN090K0dFSzJtR01nVURod2lFZnAy?=
 =?utf-8?B?bjFiU253Yi9IcUU0MVI5TVN5c2pBcHNjWmRVRFd3TTJQRTFNai8vVFNSNWk1?=
 =?utf-8?B?S3dmZXpqNzBWYmRNdFpoTXlzRHVZem1aOGVwVnVLY3YwNldkeS9rdHB4cVBS?=
 =?utf-8?B?L0swM2tiOWRSa2IrWjJVOTJZWFFscGxEaDhHZGJPTDkzbmxQdTZuOXVsVFg0?=
 =?utf-8?B?c05tZ3VPNytFNnluTVNhajFhWUM4dDB0RWtJME5rYzZIckNqNDczTGdyKy9n?=
 =?utf-8?B?c0pzMGV5Ymh0MmxwQ2JrYnZpUzZrM0p6M1lreExxQVh4TWdvL1oxT2VkeGcx?=
 =?utf-8?B?K25WQTgzR0w4cWJndEMwdzJUUkkrbStXd1VWeG1nbjByT1Q5SjJ1bFFpZ1J2?=
 =?utf-8?B?ai92OHc1aHlDUHE5enBBR1VjejhlMGFVUlcwMHpQN3ZrWDROZ1p5SHFrNjVX?=
 =?utf-8?B?YzFkdkdqSEQ3czBFRjkyR3MzeVpZclVNbVBGMXBNcUJkNUN0enQySWUyd2xL?=
 =?utf-8?B?eEFVWDRHYjJuc0FzTm5HODd5UUlXZFVQNjZrZWF2OElZVUN2dmVUNndmMmo0?=
 =?utf-8?B?Q2poY3UxMmRlUW0xeTc3dkk1cjlUTzgwcXlNcDVjaUxIOUw5Y25HbXVzTUlv?=
 =?utf-8?B?NFMzVHB3ZUFKRU55NGw1OUlGNTE3NU1QazUzMWR5UFJmMlVaN3NpZjNweDd1?=
 =?utf-8?B?dEdjcEg5VjdlV2F0VFVML1JrZUFnRm9ta3pwWG1MNXpnV0N6RVJ5aDM0bTZt?=
 =?utf-8?B?WlNiTzgzM0RJaFdWSUNJcHpmdWtHZUFoNWhlZlZjWUMvaUlxSDhtU2Zabm9H?=
 =?utf-8?B?M2tseVVXMStyS0F3RE9mTERWOGc4d0ZjTnJYS2lBWFFRMGhodStRTDNLbzFK?=
 =?utf-8?B?eWFRUkRnZmdVWVZQM1N6TkJzdlFiL2xqTHRXMVB6cy9oWElDcHdmcTJXSk5h?=
 =?utf-8?B?enpLdEVTMUhTbGY3K2JaT0dYZWdHaTVpUEx1bExSZ3JVS003UUNmMllFcG4z?=
 =?utf-8?B?a1BhaHREWHUwdEVTcHRnd25UYldId0VkZW5yV20ySitpbHZIdlA5MnFwRk51?=
 =?utf-8?B?ekc0LzJLalgzRHo4cWRxYVNNWFRNM0NZclJWdzlhMGYreGtRVGVCYzRrZDZT?=
 =?utf-8?B?SHlMNkdjSmRaTjJGaFp2K0s4dnpzUWlsUlV6QmlXbUZYbEJVSTl5TkVsdkNv?=
 =?utf-8?B?TExMNEtQMExqcDRydStSS3Jvd3gwTUJtMGJNZUZOMEtGajlua0ZFVDIzQU5x?=
 =?utf-8?B?RWdlWGtGcjc1TUZlMFBWVGMzRTVrVWw1Skd2NHJoZnl5YlZuSzRaY09ZRmVi?=
 =?utf-8?B?K0l6NWZnZUIveTErQndpdktTTEpCa2RIdGRHRThVY2JJNDU5WXZiMnpMVjhw?=
 =?utf-8?B?QUpoNjYyMXR3Q20rMm1VcFFBUlcwaDNMU282WGFCTjNMcWtjUVo3M0xNK2Uy?=
 =?utf-8?B?aXorbk1ZaDc5NGJuamtxVFB4WFlSNTlvclZVY1JCSlJmeW1USFlmQmFHZ3NL?=
 =?utf-8?B?RjJkZTk0YmgyUkhXK2x0clhzTG10U1hxWkU1aGpwYnlDUERvTFBQdnQvbE5h?=
 =?utf-8?B?alVTTUV6QzdrMXFJU2FIc09YU1RxTkl4Z0YyMVpBVFlIOTI0Yk5aWFdScENQ?=
 =?utf-8?B?c1FiVkFOZ0lYUXFFQVZmNXNOUXQ2TWR6NnhCY0pDWXZSSUR0aFNRcWJscU00?=
 =?utf-8?Q?0ySP20ANqnNomFKMJgc+1Og=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452f8675-4ff9-4789-b801-08db197d0e1a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 11:15:10.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTzR5Mbvd0aSRjou/FQXOITDXh1RTq/S8oCnwddwqudEEQ7TtvPw+bpIdYGTnN/I+4fUlofj/fEiOnUkuQd1nFhhawLomIfp2FmwsFW3mBrsp/XtY8qUPryOxVnJtIE9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8929
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 11:15:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3755

Hi Michael,

On 2/27/23 16:01, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Replace :ref:`path/docname.rst:section title`
> by `section title`_, which is much more compact and
> doesn't need changing when you change the document file name.
> 
> There are drawbacks though:
> 
> - There are no warnings at compile time when the trailing
>    `_` character is omitted. You just get plain italic text
>    without a link. However, you do get an error if `_` is
>    present and the text doesn't correspond to an existing target.
> 
> - The capitalization of the link text doesn't necessarily
>    match the one in the target. You get the capitalization that you
>    specify in the text between quotes (target matching is
>    case insensitive).
> 

Does it also detect when a link is broken because the section got 
renamed or removed?

Cheers,
Quentin

