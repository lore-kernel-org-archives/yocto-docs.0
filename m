Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EF7C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 19:32:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6650.1790278354294015524
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 12:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xsrjjntI;
 spf=pass (domain: siemens.com, ip: 40.107.130.65, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt5Y7jQMle/QbJDGPblMSOjYVp9tuaeb7//3isR7lKLiEkFuvSwuqThMFYmtzWW2qfXXuHAZwW6/LmF38/CMR2zC4NUkEfqT5Q87+puwVF/Ze51cFifYZKTz8LLxhColpIQBr5tOecEAjtC2ASibYeCyZ3HNLe17IuZcNHa5F0NEpsaF0NihGMNGReFFCGLOL6RUFYPEFbt3qX5AuPMN7Py4TrlhVaoO/fzrWtrM7GiSQJyWDyr+uW6Rh5ZKhCaQoR9UCUJgebPSpwrcYR/GCCuOaXKc6KYYlVfXQMULDQ0mDjPkBqbSrGZBRmyo00UmISpeMyiqpW8+KUi0vxz+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hFg82VaXO6SQqEf4Nkmu80CLExUVL49JWmsvxa3RkQ=;
 b=b5Nec6YGyXDGj8r/sTQE3vCNuXpIhvs3IyE8IKuu7nBc8pTF4pS01KIteAvNQU0ZKdOo5cSILLOkPvLnHCy7qOeyh2noWM20xE8xfhno/MWUvJY4cEPUeWOuOnP4LQ9Ul7VqGb9CqcoH/AUtGF/CqDVxXkX0lxXekA161t3kD6+218OIEuUJU1gjhi7dphIJ2Qe1856MJH3Ks68EA0T+VRvtxwYhHCtZ2IqXr6kwsY8Fw2RzRYeAwadTLzLXXq/fA7/sutxLsScqsgqzBmQaFW5yyqguA5oH8FKLKL5lFjOCZ+8dZIjBbet2kSW5KVI8BjYAcmCWjPMovpmdulAUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hFg82VaXO6SQqEf4Nkmu80CLExUVL49JWmsvxa3RkQ=;
 b=xsrjjntIVMAQJ7E9eIbTTtgrM8c386+4BdTyOqy5JmYwV9lCv4rl9gG/4rRau+LROeM9reoDOHmajhUb1NjddoYB/agnpVdJ8sFMqJFIJQeuEfnFzaSiptKnCiBmy4Y+HlFmyxIrU7myF81QsApEzIfQG2XlWkD3RW+PFH6+o99Yag0vQp0oOKGin9qZkb9iYn5UdMuuAYnLPbRFMy5SwmQNJUcnjrhckndby+Hu294vZmXnHw6x8qAJufCLvjF8TH61OkTOs7j+GAN552oIKLsDF25/Zn/TrlIrAQp2QA8VP1dzcQnvSWaUlrnfgK6l6/X80H9g4xx7vhv8cYlSsQ==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by DB9PR10MB7338.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:462::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 19:32:29 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 19:32:29 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/4] conf.py: enable sphinx.ext.graphviz extension
Thread-Topic: [docs] [PATCH 2/4] conf.py: enable sphinx.ext.graphviz extension
Thread-Index: AQHdQf9TeTgoDd9c8Eihu4hte4ekILbaUaSAgAAIQoCAA9j3AA==
Date: Thu, 24 Sep 2026 19:32:28 +0000
Message-ID: <bf814b4efb0d4ccee349c1ffe61882dbfec62441.camel@siemens.com>
References: <20260911150750.75697-1-adrian.freihofer@siemens.com>
	 <20260911150750.75697-2-adrian.freihofer@siemens.com>
	 <DLLP3P6UGBWU.5MIE87WD6FE@bootlin.com>
	 <DLLPQC2GSTR8.2EVI8ZYZL5J1E@bootlin.com>
In-Reply-To: <DLLPQC2GSTR8.2EVI8ZYZL5J1E@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|DB9PR10MB7338:EE_
x-ms-office365-filtering-correlation-id: 53773c08-ca86-4953-8715-08df1a729229
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 Y/omW4ggS3KICKZ/OD+6Dx25d8/3jAFYN/qg8wk9pKrDFEdmSz/c2vcKTqYMBnXi5JZcwVt3D3ROsq6LZPNOp8jNNiKPLUKDNL8IZkKCRIPBTbNxOMroTl52E/OkRnuYQXyMO9cMTbNXYOZvhqtG44isnRK51ZwiWnopKMCByuPY6iJRnGJe2RdZhJkFbvB0puRDoOrLIc41TGp3k5UnNdYhT68T64idpWVOArBcKY/uaYrR4PpjUoGcrjcEny41hTClFe0pRIjkes2VS/Jqo6POyWcNqI5vNZhQJEkLsk2Sb/wvd6wd7h83iGuY7j47cgLdXYyhzGzHcUdPNLxyT5AIE5Bt+7UVo4LlsCUrxaydSm9BauhHzV9F2ahEiIO3NYqF31V8o+2mh4pRYyFjjovp7cAUvqI2X1BOFeda+5HdJ+bvuFf5jbjkRe6B6+WLRgxu1B+F48wQOW/xT1InXtrZAIKXCbxlcV5yAVknBSkELSgyf7Jb9hZLjpTJHp5W0bP8qCzARSOtvnSJISL8kHA6JEb3t1j+mEWBgKB9geanvNLFL/ykbalJiKY3qWcJhjg1/w6adHDV8n/k3TiwRo5iI7Kvek0GaORZUPEK5PiTGpSpXHLBuHnip36xECnWIoJx4HOMjzOOb1yZvKP0IryWrlW3rXntij/qkpcIEVM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WG4vaDZwMUNZT3d3WW9zNnpxK0lqOEdSWlhsWURuWFFydlNaN25pQ1lTN3JQ?=
 =?utf-8?B?RThNek0wRlBxMUx3NUV6dklkZ2Z2amIxckQxbEFuaG12UGtoOEgzRXIzUTRY?=
 =?utf-8?B?a0pDM0xLM1I0ZnRlM0lBUkFBS08vSDlteVBQaVc5azI3c0NoN2tSYVZ0MzVm?=
 =?utf-8?B?elRldGZ4ZmtDUWZGelFGd2dEVzVFRHRWYWQ2NERvbExzdmlGNVZ4aXE4TW9s?=
 =?utf-8?B?NXY4Y3gvclQzVmN1VWc4ZVJUZzA1ZEFGYlJLelMvQ3lnQjRzcWNPNHFGbHBV?=
 =?utf-8?B?M3dZeTZGcjV6Q3kvRS9vdmZnWU8zbjMwQXlPSHdpakhaNkNxU3VIclRKb0No?=
 =?utf-8?B?UVFPekR6UE11aUNTUTIwTkUyRTZocFZQdXBlNjBNUkduSDVtTXdrNkdFcEZi?=
 =?utf-8?B?TEU3RkdJclVjMzBnb0EyL2lKUFV1R1RxcnhWUGpXZUhyaTl2cDlscjNVOVNj?=
 =?utf-8?B?Y0M4VndwVUd5RWpJcllyZmc1cmNBd1NZdDFPSHBBZjUrb3kxRWZQd21icVpO?=
 =?utf-8?B?dVh1K3RJbWlWUTBtTTkvdE1ZSXVpaldDeURNWVpCdXhOOXFCRFUrZHlQMmkv?=
 =?utf-8?B?NmdJb2kwemNOcjdSYnJGc1JWU2Q1cUgrOStianRYRFNKcVpleG9jNFZOS2dZ?=
 =?utf-8?B?ZmNqNmkxc0xWdGp4OTFXdVk3VFF4SG0yWmIvRmdtOWNlK2VzM282eUZDSTdJ?=
 =?utf-8?B?bHBUTTdTVldQZmlUSWN1eUdMQ21UeWIrMUxVS0o2R0UwbjdGTmJuRGFBV09B?=
 =?utf-8?B?STZvYjY4dGhTRlAxMlZ6OWViVmRxbFBIWVcvcnZHZml4RjRNYzdQMFRwai9E?=
 =?utf-8?B?cTdmNjkrOXBBTTI4S01aZGE0TEppWlFxYzgybFpEdWMzb2Z2WDRVaWVtSjVM?=
 =?utf-8?B?eWJUcExNcGxnZzRHMndWSGh6bmI0WFMzS3h4L1pxb1ljeWh3QUtDSXo4QUxa?=
 =?utf-8?B?YXgxdDc2Wm9ncy9VVTNsRVg1eHN6ZGVWaXZ6akZpdXpiOGQzczlGM3dkbE1F?=
 =?utf-8?B?VFRFd2JQbFhHYmVRV3hXT0VwaW5RZ1pZZVdiWmdwWnRHQXdDRStOa3lVTytk?=
 =?utf-8?B?MXlhblppZWQ5bnI2OWg4ekVERDV4S2hpaHRmdWZjbWVsRFc0NW5TWS81dHpZ?=
 =?utf-8?B?a0NySVVxczJQbFQ5QjBYRDU3c2ZIZmlsZllOQW9TcHY1dTJjVndlaXBFbGxq?=
 =?utf-8?B?RThjY2pDSFJ1SzhZVlZMN3NQNTJJYmFIcXZFU1pkUlkycEJwUlNsMEN4YWkr?=
 =?utf-8?B?eGswODNpeUV4bzdKN2I1cGI2bkxPeXgxZjJtdUxlaGRLN20xVUNOVTdzL3dO?=
 =?utf-8?B?TG5jVHg4UmlOdHczbitCS1loUVI1b3JSdUJDZkZPMDdBWXREOGYvZnJhR3h6?=
 =?utf-8?B?SnZSLzltNkdxSVNRR1ZJRWNEUVJ2YnVrUFBBZFRmVlJWMVBJdHUvUlZWeDla?=
 =?utf-8?B?VFNQYU1peWFMQllaRVBOWWd3a1VMV2JrQjZCRkpTelM5aUVMdWN0WDJmR1pI?=
 =?utf-8?B?dXg3YWdydi84MHJhWm5kQVVmS1gzZU5xZ1U1R2hNQXRYOUl0Q1c3cUQ4MzBh?=
 =?utf-8?B?Sm5UcXBOdUVyUXIvenF2UmtweFFjZzNWMVIwZzFjRjRHbm9rR01INDRsQ21D?=
 =?utf-8?B?U3ltUlRIMktSQ3ViZUxsWXBUNi91WU91bFllcExEZHUza25ZTndjSGI1amZQ?=
 =?utf-8?B?TE1SMThiTjB4amhtbXZod01wNk5uWGZwcGZKell5V0pQYzk3TVdNS094R0Rt?=
 =?utf-8?B?T0FuTmtvd3pOSW0yL3lHcUlGM0tlZElqUXJsdDEzN0F1NitxN2huaHpPSEJ0?=
 =?utf-8?B?ejRUUVRWN0tiazZwWkZTWGtDTGdaTUZQTEhJLzFGU0Y5cE82d1ZNcTJRQjNi?=
 =?utf-8?B?ZlpSV1ZZaFNDTUxaVXUyOGxLT3VkWkFjTWY4ZE1CSGtyaTBuRVkybEJFdWRj?=
 =?utf-8?B?UHA4ZkhjU2dlcDlCTFpKK1BUMUhFVEZQY3hkNVVteWxQeW5XTG81RzErOUY4?=
 =?utf-8?B?RTF5V1VHN0tlSFJIMVQ3OUV0NzFaN2JCRnc0Z0xqQjQ0eER4cmJtV2hxckZr?=
 =?utf-8?B?K3FzekJyUTlhM0tXMXFRd202TFU0RmNWNFg1MFF2Skx5Mm1tejFVdlgxcEJo?=
 =?utf-8?B?ejV1bUtYa243R25KbmU3WFFWRzVhRGJ5R1duZHFNZGRYOTF3Ylh2dUJyaDho?=
 =?utf-8?B?QU5oMC9ncGVwMDJMSmhIQlJwSU44NXFCUkUybUlnalNtMmE2NVlId21ycVRn?=
 =?utf-8?B?Z2gza2NPUnY5R0orczA3eXF5cHl6T3EyZWdLWjNRaU0rcG5wSGxFcXgzbUho?=
 =?utf-8?B?K044S0ZrL3VXMXhzQ0RCY0FZS0lNd0pPdFd6YkhETG5sQWMzVEZydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B570464FBE4F34484F308DF03F3C368@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53773c08-ca86-4953-8715-08df1a729229
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 19:32:29.0592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jyhg1AJvfgVx5gCMoMleAzQMwCrbXpiwdCEv5fNd/bJiQzg+XZ4HmCpsjcUf8l3l7cHW9+Ne+I/497RSYIpKCAxfLLb5oSRspA55F2BzU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7338
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 19:32:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10640

SGkgQW50b25pbgoKaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvZG9jcy9tZXNzYWdl
LzEwNjM0IHNob3VsZCBkbyBpdC4KClRoYW5rIHlvdS4KUmVnYXJkcywKQWRyaWFuCg==

